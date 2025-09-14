const fs = require('node:fs').promises;
const path = require('node:path');
const glob = require('glob');

class TaskReferenceValidator {
  constructor(rootDir) {
    this.rootDir = rootDir;
    this.taskFiles = new Set();
    this.issues = [];
  }

  async validate() {
    console.log('Validating task name consistency...');

    // 1. Discover all task files
    await this.discoverTaskFiles();

    // 2. Scan guidance text for task references
    await this.scanForTaskReferences();

    // 3. Report results
    this.reportResults();

    return this.issues.length === 0;
  }

  async discoverTaskFiles() {
    const patterns = [
      path.join(this.rootDir, 'bmad-core/tasks/*.md'),
      path.join(this.rootDir, 'expansion-packs/*/tasks/*.md'),
    ];

    for (const pattern of patterns) {
      const files = glob.sync(pattern);
      for (const file of files) {
        const taskName = path.basename(file, '.md');
        this.taskFiles.add(taskName);
      }
    }

    console.log(`  Found ${this.taskFiles.size} task files`);
  }

  async scanForTaskReferences() {
    const filesToScan = [
      // Core guidance files
      path.join(this.rootDir, 'bmad-core/**/*.md'),
      // Expansion pack files
      path.join(this.rootDir, 'expansion-packs/**/*.md'),
      // Documentation that might reference tasks
      path.join(this.rootDir, 'docs/**/*.md'),
    ];

    for (const pattern of filesToScan) {
      const files = glob.sync(pattern);
      for (const file of files) {
        // Skip the task files themselves
        if (file.includes('/tasks/')) continue;
        await this.scanFileForTaskReferences(file);
      }
    }
  }

  async scanFileForTaskReferences(filePath) {
    try {
      const content = await fs.readFile(filePath, 'utf8');
      const lines = content.split('\n');

      for (const [index, line] of lines.entries()) {
        this.findTaskReferences(line, filePath, index + 1);
      }
    } catch {
      // Skip files that can't be read
    }
  }

  findTaskReferences(line, filePath, lineNumber) {
    // Common patterns for task references in BMAD files:
    // 1. `task-name` (in backticks)
    // 2. *task-name (asterisk prefix for commands)
    // 3. /task-name (slash prefix)
    // 4. "task-name" (quoted)
    // 5. task-name in guidance context

    const patterns = [
      /`([a-z][a-z0-9-]*[a-z0-9])`/g, // `task-name` in backticks
      /\*([a-z][a-z0-9-]*[a-z0-9])\b/g, // *task-name commands
      /\/([a-z][a-z0-9-]*[a-z0-9])\b/g, // /task-name references
      /"([a-z][a-z0-9-]*[a-z0-9])"/g, // "task-name" quoted
      /\b([a-z][a-z0-9]*-[a-z0-9-]*[a-z0-9])\b/g, // hyphenated words that look like tasks
    ];

    for (const pattern of patterns) {
      let match;
      while ((match = pattern.exec(line)) !== null) {
        const taskName = match[1];

        // Skip if it's clearly not a task name or if it exists
        if (!this.looksLikeTaskName(taskName) || this.taskFiles.has(taskName)) {
          continue;
        }

        // Find similar task names
        const suggestions = this.findSimilarTaskNames(taskName);
        if (suggestions.length > 0) {
          this.issues.push({
            file: path.relative(this.rootDir, filePath),
            line: lineNumber,
            taskName,
            suggestions,
            context: line.trim(),
          });
        }
      }
      pattern.lastIndex = 0; // Reset regex state
    }
  }

  looksLikeTaskName(name) {
    // Heuristics for what looks like a task name:
    // - Contains at least one hyphen
    // - Starts with lowercase letter
    // - Only contains lowercase, numbers, hyphens
    // - Length between 4-50 characters
    // - Common task-like patterns

    if (!name || name.length < 4 || name.length > 50) return false;
    if (!/^[a-z][a-z0-9-]+[a-z0-9]$/.test(name)) return false;
    if (!name.includes('-')) return false;

    // Exclude common words that aren't tasks
    const excludePatterns = [
      /^(well-known|real-time|up-to-date|state-of-the-art|end-to-end)$/,
      /^(built-in|high-level|low-level|long-term|short-term)$/,
      /^(user-friendly|data-driven|event-driven|test-driven)$/,
    ];

    return !excludePatterns.some((pattern) => pattern.test(name));
  }

  findSimilarTaskNames(taskName) {
    const suggestions = [];

    // Look for exact substring matches first (most likely)
    for (const existingTask of this.taskFiles) {
      if (existingTask.includes(taskName) || taskName.includes(existingTask)) {
        suggestions.push(existingTask);
      }
    }

    // Then look for edit distance matches
    if (suggestions.length < 3) {
      for (const existingTask of this.taskFiles) {
        if (
          this.levenshteinDistance(taskName, existingTask) <= 2 &&
          !suggestions.includes(existingTask)
        ) {
          suggestions.push(existingTask);
        }
      }
    }

    return suggestions.slice(0, 3); // Limit to top 3 suggestions
  }

  levenshteinDistance(str1, str2) {
    const matrix = [];

    for (let i = 0; i <= str2.length; i++) {
      matrix[i] = [i];
    }

    for (let j = 0; j <= str1.length; j++) {
      matrix[0][j] = j;
    }

    for (let i = 1; i <= str2.length; i++) {
      for (let j = 1; j <= str1.length; j++) {
        if (str2.charAt(i - 1) === str1.charAt(j - 1)) {
          matrix[i][j] = matrix[i - 1][j - 1];
        } else {
          matrix[i][j] = Math.min(
            matrix[i - 1][j - 1] + 1,
            matrix[i][j - 1] + 1,
            matrix[i - 1][j] + 1,
          );
        }
      }
    }

    return matrix[str2.length][str1.length];
  }

  reportResults() {
    if (this.issues.length === 0) {
      console.log('  ✓ All task references are valid');
      return;
    }

    console.log(`  ✗ Found ${this.issues.length} potential task reference issues:`);

    for (const issue of this.issues) {
      console.log(`    ${issue.file}:${issue.line}`);
      console.log(`      Referenced: "${issue.taskName}" (not found)`);
      console.log(`      Similar tasks: ${issue.suggestions.join(', ')}`);
      console.log(`      Context: ${issue.context}`);
      console.log('');
    }

    console.log('  Note: These may be false positives. Review each case manually.');
  }
}

module.exports = TaskReferenceValidator;
