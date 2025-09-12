# Story 1.3: Project Context Management

As a research journalist,
I want to set active project context and switch between projects efficiently,
so that I can work on multiple investigations without manually specifying project parameters.

## Acceptance Criteria

1. `project-activate` task sets current project context for subsequent operations
2. `project-list` task shows all available projects with status and recent activity
3. `project-status` task displays current project progress and analysis inventory  
4. Project context persists across task executions within same session
5. Clear indicators show which project is currently active

## Integration Verification

**IV1**: Project switching doesn't affect existing non-project workflows
**IV2**: Context management doesn't interfere with agent execution or memory
**IV3**: Project status tracking remains accurate across context switches
