# Story 1.2: Project-Aware Task Enhancement

As a research journalist,
I want existing analysis tasks to operate within project context when specified,
so that my research outputs are properly organized by project while preserving existing functionality.

## Acceptance Criteria

1. `analyze-video-content` task accepts optional project parameter and routes outputs to project directories
2. `distill-wisdom` task integrates with project structure for organized analysis storage
3. `save-transcript` task stores transcripts in project-specific locations when project context provided
4. All enhanced tasks maintain full backward compatibility for non-project usage
5. Project context parameter uses consistent naming convention across all tasks

## Integration Verification

**IV1**: Non-project task invocations produce identical results to current behavior
**IV2**: Existing agent workflows continue without modification when using enhanced tasks
**IV3**: Output file formats and content remain unchanged, only location routing differs
