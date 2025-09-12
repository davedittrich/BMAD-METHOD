# Project-Aware Guidance Integration

## Overview

This document specifies how enhanced tasks integrate project context to provide context-aware guidance and recommendations when an active project context is available.

## Active Context Detection

Tasks check for active project context by reading `config/active-project.json`:

1. **Context Available**: Active project context exists and is valid
2. **No Context**: No active project context (global mode)
3. **Invalid Context**: Context references non-existent or corrupted project

## Enhanced Task Integration

### analyze-video-content Task
When active project context available:
- **Output Enhancement**: Include project-specific analysis routing information
- **Contextual Recommendations**: Suggest related analyses within the project
- **Project Integration**: Show how analysis fits into overall project research

### distill-wisdom Task  
When active project context available:
- **Output Enhancement**: Reference previous project analyses for context
- **Contextual Recommendations**: Suggest follow-up research based on project progress
- **Project Integration**: Connect insights to existing project materials

### save-transcript Task
When active project context available:
- **Output Enhancement**: Confirm project-specific storage location
- **Contextual Recommendations**: Suggest next steps based on transcript content and project focus
- **Project Integration**: Reference related project materials and analyses

## Implementation Pattern

Each enhanced task follows this pattern:

```markdown
## Project Context Integration

IF active project context exists:
  1. Read active project from config/active-project.json
  2. Validate project exists and is accessible
  3. Include project-aware guidance in task output
  4. Update project metadata if applicable
ELSE:
  5. Proceed with standard task execution (backward compatibility)
```

## Context-Aware Output Sections

### Project Context Header
When context active, tasks include:
```
**Active Project Context**: {project-name}
**Project Focus**: {project-description}
**Output Location**: projects/{project-name}/{appropriate-directory}/
```

### Contextual Recommendations
Based on project state and progress:
- **Next Research Steps**: Suggested follow-up tasks and analyses
- **Related Materials**: Links to existing project files and analyses  
- **Workflow Optimization**: Project-specific guidance for research efficiency

### Project Integration Notes
- **Cross-References**: Connections to other project materials
- **Research Continuity**: How current task fits into overall project workflow
- **Progress Indicators**: Impact on project completion and research momentum

## Error Handling

### Invalid Context Recovery
If active context references invalid project:
1. Display clear error message explaining the issue
2. Provide instructions for context cleanup or project recovery
3. Offer to deactivate context and proceed in global mode
4. Suggest using project-list to see available valid projects

### Context Validation
Before applying project-aware guidance:
1. Verify project directory structure exists
2. Confirm project metadata is accessible and valid
3. Check write permissions for project directories
4. Validate project hasn't been moved or deleted

## Performance Considerations

- Context checking adds <100ms to task execution
- Project validation performed once per task execution
- Minimal memory overhead for context information
- Graceful fallback maintains existing performance for non-project usage

## Backward Compatibility

- All enhanced tasks work identically when no active context
- Project context is purely additive to existing functionality
- No changes to core task behavior or output format requirements
- Existing workflows and integrations remain unaffected
