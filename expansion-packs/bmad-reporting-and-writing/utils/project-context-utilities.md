# Project Context Management Utilities

## Overview

This document defines utility functions and patterns for project context validation, cleanup, and state management used across enhanced tasks and project management workflows.

## Context Validation Functions

### Basic Context Validation

**Function:** `validateProjectContext()`
**Purpose:** Verify active project context is valid and accessible
**Usage:** Called by enhanced tasks before applying project routing

```javascript
// Pseudo-code for validation logic
function validateProjectContext() {
  // 1. Check if config/active-project.json exists
  if (!fileExists('config/active-project.json')) {
    return { valid: false, reason: 'no_context_file' };
  }

  // 2. Parse JSON and validate structure
  const context = parseJSON('config/active-project.json');
  if (!context.active_project) {
    return { valid: false, reason: 'no_active_project' };
  }

  // 3. Verify project directory exists
  const projectPath = `projects/${context.active_project}`;
  if (!directoryExists(projectPath)) {
    return { valid: false, reason: 'project_not_found', project: context.active_project };
  }

  // 4. Verify project metadata exists and is readable
  const metadataPath = `${projectPath}/config/project.json`;
  if (!fileExists(metadataPath)) {
    return { valid: false, reason: 'metadata_missing', project: context.active_project };
  }

  // 5. Update last_accessed timestamp
  context.last_accessed = new Date().toISOString();
  writeJSON('config/active-project.json', context);

  return { valid: true, project: context.active_project, context: context };
}
```

### Extended Context Validation

**Function:** `validateProjectIntegrity(projectName)`
**Purpose:** Comprehensive project structure and metadata validation
**Usage:** Called by project-switch and project-status tasks

```javascript
function validateProjectIntegrity(projectName) {
  const projectPath = `projects/${projectName}`;
  const validation = {
    valid: true,
    issues: [],
    structure: {},
    metadata: null,
  };

  // Check directory structure
  const requiredDirs = ['references', 'analyses', 'drafts', 'config'];
  for (const dir of requiredDirs) {
    const dirPath = `${projectPath}/${dir}`;
    validation.structure[dir] = directoryExists(dirPath);
    if (!validation.structure[dir]) {
      validation.issues.push(`Missing directory: ${dir}`);
      validation.valid = false;
    }
  }

  // Validate metadata
  try {
    const metadataPath = `${projectPath}/config/project.json`;
    validation.metadata = parseJSON(metadataPath);

    // Validate required metadata fields
    const requiredFields = ['name', 'description', 'created_date', 'status'];
    for (const field of requiredFields) {
      if (!validation.metadata[field]) {
        validation.issues.push(`Missing metadata field: ${field}`);
        validation.valid = false;
      }
    }
  } catch (error) {
    validation.issues.push(`Metadata parsing error: ${error.message}`);
    validation.valid = false;
  }

  return validation;
}
```

## Project-Aware Path Resolution

### Context-Aware Path Resolution

**Function:** `resolveProjectPath(directory, filename?)`
**Purpose:** Resolve file paths based on active project context
**Usage:** Used by enhanced tasks for automatic routing

```javascript
function resolveProjectPath(directory, filename = null) {
  const context = validateProjectContext();

  if (context.valid) {
    // Project context active - use project directory
    const basePath = `projects/${context.project}/${directory}`;
    return filename ? `${basePath}/${filename}` : basePath;
  } else {
    // No context or invalid context - use global directory
    const globalPath = directory === 'references' ? 'references/transcripts' : directory;
    return filename ? `${globalPath}/${filename}` : globalPath;
  }
}
```

### File Discovery with Context

**Function:** `discoverProjectFiles(directory, limit = 10)`
**Purpose:** Find recent/relevant files in project directories
**Usage:** Used by project-status and guidance templates

```javascript
function discoverProjectFiles(directory, limit = 10) {
  const context = validateProjectContext();

  if (!context.valid) {
    return { files: [], context_status: 'no_context' };
  }

  const directoryPath = `projects/${context.project}/${directory}`;
  if (!directoryExists(directoryPath)) {
    return { files: [], context_status: 'directory_missing' };
  }

  // Get files sorted by modification date (newest first)
  const files = listFiles(directoryPath)
    .sort((a, b) => b.modified - a.modified)
    .slice(0, limit)
    .map((file) => ({
      path: file.path,
      name: file.name,
      size: file.size,
      modified: file.modified,
      relativePath: `projects/${context.project}/${directory}/${file.name}`,
    }));

  return {
    files: files,
    context_status: 'valid',
    project: context.project,
    total_count: listFiles(directoryPath).length,
  };
}
```

## Context State Management

### Context Activation

**Function:** `activateProjectContext(projectName)`
**Purpose:** Set active project context with validation
**Usage:** Called by project-switch task

```javascript
function activateProjectContext(projectName) {
  // Validate project exists and is accessible
  const validation = validateProjectIntegrity(projectName);
  if (!validation.valid) {
    return {
      success: false,
      error: 'project_invalid',
      issues: validation.issues,
    };
  }

  // Generate session ID
  const sessionId = generateSessionId();

  // Create context object
  const context = {
    active_project: projectName,
    context_set_date: new Date().toISOString(),
    session_id: sessionId,
    last_accessed: new Date().toISOString(),
    context_source: 'manual',
    project_metadata: validation.metadata,
  };

  // Create config directory if needed
  ensureDirectoryExists('config');

  // Save context
  writeJSON('config/active-project.json', context);

  return {
    success: true,
    project: projectName,
    session_id: sessionId,
    metadata: validation.metadata,
  };
}
```

### Context Deactivation

**Function:** `deactivateProjectContext()`
**Purpose:** Clear active project context
**Usage:** Called by project-switch task when deactivating

```javascript
function deactivateProjectContext() {
  if (!fileExists('config/active-project.json')) {
    return { success: true, was_active: false };
  }

  const context = parseJSON('config/active-project.json');
  const wasActive = context.active_project;

  // Clear context but preserve deactivation record
  const deactivatedContext = {
    active_project: null,
    context_set_date: new Date().toISOString(),
    session_id: context.session_id,
    last_accessed: new Date().toISOString(),
    context_source: 'manual_deactivation',
    project_metadata: null,
  };

  writeJSON('config/active-project.json', deactivatedContext);

  return {
    success: true,
    was_active: wasActive !== null,
    previous_project: wasActive,
  };
}
```

## Context Cleanup Mechanisms

### Automatic Context Cleanup

**Function:** `cleanupInvalidContext()`
**Purpose:** Remove context for deleted or corrupted projects
**Usage:** Called during context validation when issues detected

```javascript
function cleanupInvalidContext(reason, projectName = null) {
  const cleanup = {
    cleaned: false,
    reason: reason,
    previous_project: projectName,
    timestamp: new Date().toISOString(),
  };

  if (fileExists('config/active-project.json')) {
    const context = parseJSON('config/active-project.json');
    cleanup.previous_project = context.active_project;
    cleanup.cleaned = true;

    // Clear context with cleanup record
    const cleanedContext = {
      active_project: null,
      context_set_date: cleanup.timestamp,
      session_id: generateSessionId(),
      last_accessed: cleanup.timestamp,
      context_source: 'auto_cleanup',
      cleanup_reason: reason,
      project_metadata: null,
    };

    writeJSON('config/active-project.json', cleanedContext);
  }

  return cleanup;
}
```

### Context Expiration Management

**Function:** `checkContextExpiration(maxAge = 30)`
**Purpose:** Clean up stale context based on last access time
**Usage:** Optional periodic cleanup (called by project-status)

```javascript
function checkContextExpiration(maxAgeDays = 30) {
  if (!fileExists('config/active-project.json')) {
    return { expired: false, reason: 'no_context' };
  }

  const context = parseJSON('config/active-project.json');
  if (!context.active_project || !context.last_accessed) {
    return { expired: false, reason: 'no_active_context' };
  }

  const lastAccessed = new Date(context.last_accessed);
  const ageInDays = (new Date() - lastAccessed) / (1000 * 60 * 60 * 24);

  if (ageInDays > maxAgeDays) {
    const cleanup = cleanupInvalidContext('context_expired', context.active_project);
    return {
      expired: true,
      age_days: ageInDays,
      cleanup: cleanup,
    };
  }

  return { expired: false, age_days: ageInDays };
}
```

## Error Handling Patterns

### Graceful Context Degradation

When context validation fails, enhanced tasks should:

1. **Log Context Issues** (for debugging):

   ```
   Context validation failed: [reason]
   Previous project: [project-name]
   Falling back to global behavior
   ```

2. **Auto-Cleanup Invalid Context**:

   ```javascript
   if (!context.valid && context.reason === 'project_not_found') {
     cleanupInvalidContext('project_deleted', context.project);
   }
   ```

3. **Provide User Guidance**:
   ```markdown
   ⚠️ Project context "[project-name]" is no longer available.
   Context has been cleared automatically.
   Use `project-switch` to set a new project context.
   ```

### Context Recovery

**Function:** `attemptContextRecovery()`
**Purpose:** Try to repair common context issues
**Usage:** Called when context validation fails

```javascript
function attemptContextRecovery() {
  const recovery = {
    attempted: [],
    succeeded: [],
    failed: [],
  };

  // Attempt 1: Recreate missing config directory
  if (!directoryExists('config')) {
    try {
      createDirectory('config');
      recovery.attempted.push('create_config_directory');
      recovery.succeeded.push('create_config_directory');
    } catch (error) {
      recovery.failed.push({ action: 'create_config_directory', error: error.message });
    }
  }

  // Attempt 2: Validate and repair context file format
  if (fileExists('config/active-project.json')) {
    try {
      const context = parseJSON('config/active-project.json');
      if (!context.session_id) {
        context.session_id = generateSessionId();
      }
      if (!context.last_accessed) {
        context.last_accessed = new Date().toISOString();
      }
      writeJSON('config/active-project.json', context);
      recovery.attempted.push('repair_context_format');
      recovery.succeeded.push('repair_context_format');
    } catch (error) {
      recovery.failed.push({ action: 'repair_context_format', error: error.message });
    }
  }

  return recovery;
}
```

## Debugging and Troubleshooting Support

### Context Status Reporting

**Function:** `getContextStatus()`
**Purpose:** Comprehensive context diagnostics
**Usage:** Called by project-status task for troubleshooting

```javascript
function getContextStatus() {
  const status = {
    context_file_exists: fileExists('config/active-project.json'),
    context_readable: false,
    context_valid: false,
    active_project: null,
    project_accessible: false,
    validation_issues: [],
    last_accessed: null,
    session_info: null,
  };

  if (status.context_file_exists) {
    try {
      const context = parseJSON('config/active-project.json');
      status.context_readable = true;
      status.active_project = context.active_project;
      status.last_accessed = context.last_accessed;
      status.session_info = {
        session_id: context.session_id,
        context_source: context.context_source,
        set_date: context.context_set_date,
      };

      if (context.active_project) {
        const validation = validateProjectIntegrity(context.active_project);
        status.context_valid = validation.valid;
        status.project_accessible = validation.valid;
        status.validation_issues = validation.issues;
      }
    } catch (error) {
      status.validation_issues.push(`Context file parsing error: ${error.message}`);
    }
  }

  return status;
}
```

## Integration Guidelines

### For Enhanced Tasks

1. **Always validate context before use**:

   ```javascript
   const context = validateProjectContext();
   if (context.valid) {
     // Use project routing and guidance
   } else {
     // Fall back to global behavior
   }
   ```

2. **Handle context issues gracefully**:

   ```javascript
   if (!context.valid && context.reason === 'project_not_found') {
     cleanupInvalidContext('project_deleted', context.project);
     // Inform user and continue with global behavior
   }
   ```

3. **Update access timestamps**:
   ```javascript
   // Context validation automatically updates last_accessed
   // No additional action needed in most cases
   ```

### For Management Tasks

1. **Use comprehensive validation**:

   ```javascript
   // project-switch should use validateProjectIntegrity()
   // project-status should use getContextStatus()
   ```

2. **Provide detailed feedback**:

   ```javascript
   // Include validation results in user-facing output
   // Show context status and any issues found
   ```

3. **Support recovery operations**:
   ```javascript
   // Offer context cleanup and repair options
   // Guide users through common resolution steps
   ```
