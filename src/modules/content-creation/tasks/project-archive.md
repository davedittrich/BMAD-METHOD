# project-archive

## Task Overview

Move completed projects to an archive location, preserving all data, metadata, and relationships, while maintaining an organized active workspace.

## Instructions

1.  **Project Selection and Validation**
    -   Identify the target project for archival (uses active project context if available).
    -   Validate the project exists and is eligible for archival.
    -   Verify project completion requirements.

2.  **Pre-Archive Preparation**
    -   Analyze project components (references, analyses, drafts, config).
    -   Calculate project size for archive planning.
    -   (Future - Phase 3) Identify cross-project relationships and dependencies.

3.  **Archive Location Preparation**
    -   Create archive directory: `.bmad/archives/{year}/{project-name}/`.
    -   Initialize archive metadata.
    -   (Future - Phase 3) Prepare an entry for a global archive index.

4.  **Comprehensive Data Migration**
    -   Copy the complete project directory from `.bmad/projects/{project-name}` to the archive location.
    -   Preserve all files and metadata.

5.  **Cross-Project Reference Management (Future - Phase 3)**
    -   Update any cross-project relationship files to reflect the archived status.
    -   Update a global cross-reference registry with the new archived location.

6.  **Archive Metadata Creation**
    -   Generate a comprehensive `archive-info.json` file with project preservation details.
    -   Document the reason and timestamp for the archival.

7.  **Data Integrity Validation**
    -   Perform an integrity check comparing original and archived files.
    -   Validate the archive metadata.
    -   Generate an integrity hash for future validation.

8.  **Active Project Cleanup**
    -   Update the active project context if the archived project was active.
    -   Remove the project from the active project directory (`.bmad/projects/`).
    -   Update the project's status to "archived" in any central tracking file.

9.  **Confirmation and Reporting**
    -   Display a summary of the archive operation with the new location.
    -   Provide guidance on how to search for and restore the archived project.

## Elicitation Requirements

elicit: true
format: |
    Please specify:

    **Project Selection:**

    - Which project should be archived? (Leave blank to use active project context)
    - Confirm the project is ready for archival?

    **Archive Configuration:**

    - What is the reason for archiving this project? (e.g., completed, cleanup)
    - (Future - Phase 3) Should cross-project relationships be preserved?

    **Archive Policies:**

    - Should the archived project remain searchable?

## Output Requirements

**Archive Creation Confirmation:**

-   Confirmation of successful project archival.
-   Archive location: `.bmad/archives/{year}/{project-name}/`.
-   `archive-info.json` created with archive metadata.
-   Project lifecycle status updated to "archived".

**Data Preservation Validation:**

-   Complete project directory structure preserved.
-   (Future - Phase 3) Cross-project relationships maintained.

**Active Workspace Management:**

-   Project removed from the active projects directory.
-   Active project context updated if necessary.

**Error Handling:**

-   Clear messages for invalid projects or archive creation failures.
-   Rollback procedures for failed archive operations.
