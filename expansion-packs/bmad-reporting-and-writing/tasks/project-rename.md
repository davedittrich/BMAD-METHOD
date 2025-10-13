# project-rename

## Task Overview

Rename an existing research project while preserving all project data, metadata, and cross-project relationships to support project evolution and improved organizational clarity.

## Instructions

1. **Current Project Validation**
   - Verify the current project name exists using project-list functionality
   - Check project directory structure and metadata integrity
   - Validate project is accessible and not corrupted
   - Ensure project is not currently in use by other processes

2. **New Name Validation**
   - Validate new project name for cross-platform file system compatibility
   - Ensure no spaces, special characters, or reserved names
   - Check new name doesn't conflict with existing projects
   - Convert to lowercase with hyphens for consistency
   - Verify new name meets length requirements (3-50 characters)

3. **Pre-Rename Backup**
   - Create temporary backup of project metadata
   - Record current project state for rollback capability
   - Validate all project files are accessible before rename
   - Store rename operation metadata for audit trail

4. **Atomic Rename Operation**
   - Rename project directory from `projects/{old-name}/` to `projects/{new-name}/`
   - Update project metadata in `config/project.json` with new name
   - Update creation and modification timestamps
   - Ensure operation is atomic (all-or-nothing)

5. **Reference Updates**
   - Update active project context if renaming currently active project
   - Update cross-project references in project-link relationships
   - Update any collaboration team references
   - Search and update references in archive metadata if applicable

6. **Validation and Confirmation**
   - Verify new directory structure exists and is accessible
   - Validate updated metadata file format and content
   - Confirm all cross-project references updated correctly
   - Test basic project operations (project-status, project-switch)

7. **Rollback Capability**
   - Implement rollback mechanism in case of partial failure
   - Restore original state if any step fails
   - Provide clear error messages and recovery instructions
   - Maintain data integrity throughout process

## Elicitation Requirements

elicit: true
format: |
Please specify:

**Current Project:**

- What is the name of the project to rename? (Must match an existing project from project-list)
- Confirm this is the correct project to rename?

**New Project Name:**

- What should the new project name be? (lowercase, hyphens only, 3-50 characters)
- Brief reason for the rename (for audit trail)?

**Safety Considerations:**

- Should I create a backup before proceeding with the rename?
- Are you sure you want to proceed with this rename operation?

**Context Management:**

- If this is your currently active project, should it remain active after rename?
- Should any related projects be notified of this name change?

## Output Requirements

**Rename Success:**

- Confirmation of successful project rename operation
- Display old name → new name transformation
- Show updated project directory location
- Confirm preservation of all project data and metadata

**Updated References:**

- List all cross-project references that were updated
- Show active project context updates if applicable
- Confirm collaboration team reference updates
- Display any archive metadata updates

**Project Validation:**

- Verify project structure integrity after rename
- Confirm metadata file updated correctly
- Test basic project operations work with new name
- Show project metrics preserved (file counts, timestamps)

**Operation Audit:**

- Record rename operation in project activity log
- Include operation timestamp and reason
- Store old name in project history for reference
- Document any reference updates performed

**Error Handling:**

- Clear messages for invalid current or new project names
- Guidance for resolving rename conflicts or failures
- Rollback instructions if operation needs to be reversed
- Recovery procedures for partial rename failures

**Performance Requirements:**

- Rename operations complete in <10 seconds for typical projects
- Atomic operation ensures no data loss during process
- Minimal impact on other project operations during rename
- Automatic validation of operation success

**Integration Points:**

- Updated project appears correctly in project-list
- project-switch works with new name immediately
- project-status reflects new name and preserved data
- Cross-project commands (project-link, project-search) use new name
