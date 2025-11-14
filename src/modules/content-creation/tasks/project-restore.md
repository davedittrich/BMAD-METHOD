# project-restore

## Task Overview

Restore an archived project back to the active workspace, ensuring data integrity and seamless reintegration with project management workflows.

## Instructions

1.  **Archive Discovery and Selection**
    - Browse available archived projects from the `.bmad/archives/` directory.
    - Validate the selected archive's integrity before proceeding.
    - Display archive metadata (creation date, size, etc.).

2.  **Pre-Restoration Validation**
    - Check for name conflicts with existing active projects in `.bmad/projects/`.
    - Validate available workspace storage.
    - Verify archive integrity using any stored checksums.

3.  **Restoration Conflict Resolution**
    - Handle name conflicts with options to rename the restored project or cancel.
    - (Future - Phase 3) Resolve cross-project reference conflicts.

4.  **Comprehensive Data Restoration**
    - Copy the complete project directory from the archive location to `.bmad/projects/`.
    - Recreate project metadata from the `archive-info.json`.

5.  **Cross-Project Reference Restoration (Future - Phase 3)**
    - Update any cross-project relationship registries with the restored project's "active" status.

6.  **Project Status and Context Updates**
    - Update the project's status from "archived" to "active".
    - Add a restoration entry to the project's lifecycle history.
    - Add the project back to active project listings.

7.  **Data Integrity Verification**
    - Perform an integrity check on the restored files.
    - Validate that all project components are accessible.
    - Test basic project functionality (e.g., `project-status`).

8.  **Archive Maintenance**
    - Update the archive registry to note the restoration event.
    - The original archive is preserved for future restoration needs.

9.  **Restoration Confirmation**
    - Display a summary of the successful restoration.
    - Provide the path to the restored project.

## Elicitation Requirements

elicit: true
format: |
Please specify:

    **Archive Selection:**

    - Which archived project should be restored?
    - Any specific archive version to restore from (if multiple exist)?

    **Restoration Configuration:**

    - How should name conflicts with existing projects be resolved? (rename, cancel)
    - (Future - Phase 3) Should cross-project relationships be reactivated?

    **Integration Preferences:**

    - Should the restored project become the active project context?

## Output Requirements

**Restoration Success Confirmation:**

- Confirmation of successful project restoration.
- Restored project location in the active workspace.
- Project status updated to "active".

**Data Recovery Validation:**

- Complete project directory structure restored.
- (Future - Phase 3) Cross-project relationships reactivated.

**Active Workspace Updates:**

- Project added back to active project listings.
- Active project context updated if requested.

**Error Handling:**

- Clear messages for restoration failures or archive corruption.
- Guidance for resolving name conflicts.
- Rollback procedures for failed restoration operations.
