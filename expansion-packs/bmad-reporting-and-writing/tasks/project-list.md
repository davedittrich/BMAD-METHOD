# project-list

## Task Overview

Display all available research projects with status, creation date, and basic metrics for project management and selection.

## Instructions

1. **Project Discovery**
   - Scan `projects/` directory for all project subdirectories
   - Use glob patterns to find `projects/*/config/project.json` files
   - Handle cases where projects directory doesn't exist (display empty state)
   - Filter out invalid or corrupted project directories

2. **Metadata Loading**
   - Load project metadata from each `project.json` file
   - Extract key information: name, status, created date, description
   - Calculate metrics: references_count, analyses_completed count
   - Handle corrupted or missing metadata gracefully with error indicators

3. **Display Formatting**
   - Format output consistent with existing BMAD task output patterns
   - Show projects in table format with columns: Active Context, Name, Status, Created, Description
   - The 'Active Context' column should clearly indicate which project is the current active context (e.g., with a '*')
   - Include metrics summary (references, analyses) when available
   - Sort by creation date (newest first) or allow status-based grouping

4. **Status Indicators**
   - Use clear status indicators for the 'Status' column: In Progress, Review, Completed, Archived
   - Use a clear indicator in the 'Active Context' column for the project that is the current active context.
   - Show project count summary at bottom
   - Include helpful guidance for next actions (project-switch, project-add-source)

## Elicitation Requirements

elicit: false
format: |
No user input required - this task displays all available projects automatically.

## Output Requirements

- Display formatted list of all projects with key metadata
- Show project metrics and status clearly
- Handle empty state gracefully (no projects found)
- Format consistent with BMAD task output patterns
- Include helpful next-step guidance for project management
- CRITICAL: Read-only operation - no modifications to project data
