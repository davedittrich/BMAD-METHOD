# Project-Aware Guidance Template

## Overview

This template defines how enhanced tasks should integrate project-aware guidance and context information when an active project context is set via `project-switch`. This guidance appears automatically in task outputs when active project context is detected.

## Active Project Context Detection

Tasks should check for active project context by:

1. Reading `config/active-project.json` if it exists
2. Validating the active project still exists in `projects/{active-project}/`  
3. Using project context for guidance and file routing when valid
4. Falling back to global behavior when no active context

## Project-Aware Guidance Sections

### 1. Context Status Header

When active project context is detected, include at the top of task output:

```markdown
## 🎯 Project Context Active: [Project Name]

**Project:** [project-name]  
**Status:** [active/review/completed/archived]  
**Context Set:** [timestamp]  
**Project Files:** [references count] references, [analyses count] analyses, [drafts count] drafts

This task output will be automatically routed to the project directory structure.
```

### 2. Context-Aware File Discovery

Include a section showing relevant project materials when context is active:

```markdown
## 📁 Related Project Materials

### Recent References
- `[file-path]` - [brief description] ([date])
- `[file-path]` - [brief description] ([date])

### Related Analyses  
- `[file-path]` - [brief description] ([date])
- `[file-path]` - [brief description] ([date])

### Available Drafts
- `[file-path]` - [brief description] ([date])
- `[file-path]` - [brief description] ([date])

*Use project-status task for complete project inventory*
```

### 3. Project-Aware Recommendations

Add context-specific recommendations based on project state:

```markdown
## 🔄 Project Workflow Recommendations

### Based on Current Project State:
- **Next Suggested Tasks:** [task recommendations based on project content and stage]
- **Analysis Opportunities:** [suggestions for content synthesis or gaps to fill]
- **Organization Improvements:** [suggestions for file organization or workflow optimization]

### Integration Opportunities:
- **Cross-Reference:** [suggestions for connecting with existing project materials]
- **Synthesis:** [opportunities to combine analyses or create summary documents]
- **Follow-Up:** [recommendations for extending current research]
```

### 4. Context-Aware Output Routing

Include clear information about where content is being saved:

```markdown
## 💾 Project Context Routing

**Output Location:** `projects/[project-name]/[analyses|references|drafts]/[filename]`  
**Metadata Update:** Project metadata `[field]` updated with this operation  
**Global Fallback:** Content also accessible via standard workflow paths

*To change project context, use `project-switch` task*
```

## Integration Patterns for Enhanced Tasks

### For Analysis Tasks (analyze-video-content, distill-wisdom)

```markdown
## Project Integration Notes

When active project context is set:
- Analysis output automatically saved to project analyses directory
- Project metadata `analyses_completed` array updated
- Cross-references with existing project materials automatically included
- Recommendations consider existing project research and goals

Use `project-status` to view complete project progress and analysis inventory.
```

### For Reference Tasks (save-transcript)

```markdown
## Project Integration Notes

When active project context is set:
- Transcript automatically saved to project references directory
- Project metadata `references_count` updated
- File naming follows project conventions for easy discovery
- Automatic categorization with existing project references

Use `project-status` to view complete reference inventory and suggestions.
```

### For Creation Tasks (create-doc)

```markdown
## Project Integration Notes

When active project context is set:
- Draft automatically saved to project drafts directory
- Document templates include project-specific context and materials
- Cross-references to project analyses and references automatically included
- Draft naming follows project conventions for version control

Use `project-status` to view draft progress and organization suggestions.
```

## Conditional Display Logic

### When Active Project Context Available:
- Include all project-aware guidance sections
- Show context status and file discovery
- Provide project-specific recommendations
- Display routing information clearly

### When No Active Project Context:
- Maintain existing task behavior (no changes to current functionality)
- Optionally include brief note about project context benefits:
  ```markdown
  💡 **Tip:** Use `project-switch` to set active project context for enhanced workflow integration and automatic file organization.
  ```

## Error Handling Guidance

### When Active Project Context Invalid:
```markdown
⚠️ **Project Context Warning:** Active project "[project-name]" no longer exists.
Context has been automatically cleared. Use `project-switch` to set a valid project context.

This task will proceed using global workflow behavior.
```

### When Project Directory Issues:
```markdown
⚠️ **Project Access Warning:** Cannot access project directory structure.
Check permissions and project integrity. Use `project-status` for diagnostics.

This task will proceed using global workflow behavior.
```

## Performance Considerations

- Context detection should add < 50ms to task execution
- File discovery limited to most recent/relevant items (5-10 entries max)
- Metadata reading cached when possible
- Graceful degradation when project files inaccessible

## Implementation Guidelines

1. **Preserve Existing Behavior:** Never break existing functionality when no project context active
2. **Progressive Enhancement:** Project guidance enhances but doesn't replace existing task functionality  
3. **Clear Indication:** Always make it obvious when project context is affecting task behavior
4. **User Control:** Provide clear guidance on how to manage project context (project-switch, project-status)

## Template Usage in Tasks

Enhanced tasks should include these guidance sections when active project context is detected:

1. Check for `config/active-project.json`
2. Validate project exists and is accessible
3. Include appropriate guidance sections from this template
4. Maintain fallback to existing behavior when no context
