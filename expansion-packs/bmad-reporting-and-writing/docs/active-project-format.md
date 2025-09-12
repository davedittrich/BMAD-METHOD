# Active Project Context Format

## Overview

The active project context persistence system uses a JSON configuration file to maintain project context across CLI sessions and workflow executions. This document defines the format and usage patterns for the `config/active-project.json` file.

## File Location

- **Global Configuration**: `config/active-project.json` (created in working directory or user config location)
- **Purpose**: Maintain active project context across BMAD workflow sessions
- **Scope**: Single active project context per user/environment

## JSON Schema

```json
{
  "active_project": "project-name-or-null",
  "context_set_date": "ISO-8601-timestamp",
  "session_id": "unique-session-identifier", 
  "last_accessed": "ISO-8601-timestamp",
  "context_source": "manual|auto-detected|restored",
  "project_metadata": {
    "name": "project-name",
    "description": "project-description",
    "created_date": "ISO-8601-timestamp",
    "status": "active|review|completed|archived",
    "references_count": 0,
    "analyses_completed": []
  }
}
```

## Field Specifications

### Core Context Fields

- **`active_project`**: String - Currently active project name (null if no project active)
- **`context_set_date`**: ISO-8601 timestamp - When context was last activated  
- **`session_id`**: String - Unique identifier for current workflow session
- **`last_accessed`**: ISO-8601 timestamp - Most recent context usage for cleanup purposes
- **`context_source`**: Enum - How context was set (manual, auto-detected, restored)

### Project Metadata Cache

- **`project_metadata`**: Object - Cached project information for quick access
- Mirrors structure from `projects/{project-name}/config/project.json`
- Updated when context is activated to avoid repeated file system access
- Used for context validation and status reporting

## Usage Patterns

### Context Activation

1. Validate project exists in `projects/{project-name}/` directory
2. Load project metadata from `projects/{project-name}/config/project.json`
3. Create/update `config/active-project.json` with new context
4. Generate unique session ID and set timestamps

### Context Validation

1. Check if `active_project` value corresponds to existing project directory
2. Verify project metadata file exists and is accessible
3. Update `last_accessed` timestamp on successful validation
4. Clear context if project no longer exists

### Context Deactivation

1. Set `active_project` to null
2. Preserve deactivation timestamp in `context_set_date`
3. Clear project metadata cache
4. Maintain session information for potential reactivation

## Integration with BMAD Tasks

### Task Context Resolution

Enhanced tasks from Story 1.2 check for active project context:

1. Read `config/active-project.json` if it exists
2. Use `active_project` value for automatic project routing
3. Fall back to global behavior if no active context
4. Update `last_accessed` timestamp when context is used

### Context-Aware Task Behavior

- **save-transcript**: Automatically routes to project references directory when context active
- **analyze-video-content**: Uses project context for analysis routing and metadata updates
- **distill-wisdom**: Routes wisdom output to project analyses directory when context active

## Error Handling

### Missing Context File

- Tasks gracefully fall back to global behavior
- No error messages when `config/active-project.json` doesn't exist
- Context-aware features simply disabled

### Corrupted Context

- Invalid JSON handled with graceful fallback to global behavior
- Context validation detects and clears invalid project references
- Error logging follows existing BMAD task error reporting patterns

### Project Deletion

- Context validation detects when active project no longer exists
- Automatic context cleanup removes invalid project references
- Clear user feedback when context becomes invalid

## Performance Considerations

- Context file kept small (< 1KB) for quick read/write operations
- Metadata caching reduces repeated file system access
- Context operations complete in < 100ms
- Lazy loading - context only checked when needed by enhanced tasks
