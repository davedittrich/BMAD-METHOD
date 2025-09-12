# Story 1.1: Project Infrastructure Foundation

As a research journalist,
I want to initialize isolated research projects with standardized directory structure,
so that I can organize multiple concurrent investigations without cross-contamination.

## Acceptance Criteria

1. `project-init` task creates standardized directory structure (`projects/{project-name}/{references,analyses,drafts,config}`)
2. Project initialization includes project metadata file with creation date, description, and status tracking
3. Project directory structure follows existing expansion pack patterns for consistency
4. Multiple projects can exist simultaneously without conflicts
5. Project names are validated to prevent file system issues across platforms

## Integration Verification

**IV1**: Existing workflows continue to function normally when no project context is active
**IV2**: Global `references/` directory remains functional as fallback for legacy operations  
**IV3**: No performance degradation in non-project task execution
