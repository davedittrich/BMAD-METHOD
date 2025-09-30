# Project Context Validation and Cleanup

## Overview

This document specifies the validation and cleanup mechanisms for project context management to ensure system reliability and graceful error handling.

## Context Validation Process

### Initial Context Check

When reading `config/active-project.json`:

1. **File Existence**: Verify config file exists and is readable
2. **JSON Validity**: Parse JSON and validate required fields
3. **Project Existence**: Confirm referenced project directory exists
4. **Structure Integrity**: Validate project has proper directory structure
5. **Metadata Access**: Verify project metadata file is accessible

### Required Fields Validation

Active project context must contain:

- `active_project`: Non-empty string matching existing project
- `context_set_date`: Valid ISO timestamp
- `session_id`: Unique session identifier
- `last_accessed`: Valid ISO timestamp
- `context_source`: Valid enum value (manual, auto-detected, restored)

### Project Structure Validation

Referenced project must have:

- Base directory: `projects/{project-name}/`
- Required subdirectories: `references/`, `analyses/`, `drafts/`, `config/`
- Valid metadata: `projects/{project-name}/config/project.json`
- Accessible permissions for read/write operations

## Cleanup Mechanisms

### Automatic Cleanup Triggers

Context cleanup occurs when:

1. **Project Deleted**: Referenced project no longer exists
2. **Corrupted Metadata**: Project metadata file damaged or invalid
3. **Permission Issues**: Project directories no longer accessible
4. **Stale Context**: Context older than configured expiration (default: 30 days)

### Cleanup Operations

#### Graceful Context Deactivation

When invalid context detected:

```json
{
  "active_project": null,
  "context_set_date": null,
  "session_id": null,
  "last_accessed": null,
  "context_source": null,
  "cleanup_reason": "project_not_found",
  "cleanup_date": "2025-01-09T15:00:00Z"
}
```

#### Context Recovery Options

For recoverable issues:

1. **Project Moved**: Attempt to locate project in common locations
2. **Permission Fixed**: Retry validation after brief delay
3. **Metadata Regenerated**: Offer to recreate missing project metadata
4. **User Intervention**: Present clear options for manual resolution

## Error Handling Strategies

### Validation Failure Response

When context validation fails:

1. **Clear Error Messages**: Explain exactly what went wrong
2. **Recovery Suggestions**: Provide actionable steps for resolution
3. **Fallback Mode**: Continue in global mode with full functionality
4. **User Choice**: Allow manual cleanup or context deactivation

### Common Error Scenarios

#### Project Not Found

```
Error: Active project 'research-project' not found.
- Project may have been deleted or moved
- Run 'project-list' to see available projects
- Use 'project-switch' to activate a different project
- Or continue in global mode (no project context)
```

#### Corrupted Project Metadata

```
Error: Project metadata corrupted for 'research-project'
- Metadata file: projects/research-project/config/project.json
- Consider regenerating metadata or restoring from backup
- Project files appear intact, only metadata affected
- Use 'project-switch' to deactivate context if needed
```

#### Permission Issues

```
Error: Cannot access project 'research-project' due to permissions
- Check file permissions for projects/research-project/
- Ensure current user has read/write access
- Contact system administrator if needed
- Continuing in global mode for now
```

## Context Expiration Policy

### Default Expiration Settings

- **Active Context**: 30 days without access
- **Session Context**: 7 days since last task execution
- **Abandoned Context**: 90 days since project activity

### Expiration Handling

When context expires:

1. **Soft Expiration**: Warning message, allow continued use
2. **Hard Expiration**: Automatic cleanup and deactivation
3. **Grace Period**: 7-day warning before hard expiration
4. **Manual Override**: Allow user to refresh expired context

## Monitoring and Maintenance

### Health Checks

Regular validation includes:

- Context file integrity checks
- Referenced project accessibility
- Metadata consistency validation
- Permission and ownership verification

### Cleanup Scheduling

Automatic cleanup runs:

- **On Context Access**: Real-time validation during task execution
- **Session Start**: Validation when BMAD CLI initializes
- **Daily Maintenance**: Scheduled cleanup of stale contexts (optional)
- **Manual Trigger**: User-initiated cleanup via project management tasks

## Integration with Task Execution

### Task-Level Validation

Each enhanced task performs:

1. **Context Validation**: Check active context before project routing
2. **Graceful Fallback**: Switch to global mode if context invalid
3. **User Notification**: Inform user of context issues and resolution options
4. **Automatic Cleanup**: Clean invalid context to prevent repeated failures

### Performance Impact

- Context validation adds <50ms per task execution
- Cleanup operations complete in <200ms
- No impact on global mode task performance
- Minimal memory overhead for validation logic
