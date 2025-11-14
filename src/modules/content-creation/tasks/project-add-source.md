# project-add-source

## Task Overview

Add new research materials to projects with intelligent deduplication, automatic content type detection, and seamless integration with existing analysis workflows for iterative research building.

## Instructions

1.  **Source Validation and Processing**
    - Validate source URL format and accessibility for videos, documents, and external sources
    - Perform automatic content type detection: video, document, transcript, external-source
    - Extract source metadata: title, publish date, content description, duration (videos)
    - Generate a content fingerprint for deduplication detection.

2.  **Intelligent Deduplication System**
    - Check for existing sources within the project.
    - (Future - Phase 3) Check existing sources across all projects using a global source index.
    - Present deduplication options: skip duplicate, create cross-reference, update existing source.

3.  **Source Addition to Project**
    - Add source to the project-specific sources registry with complete metadata.
    - Initialize source with version 1.0 and current timestamp.
    - Set `analysis_status` to 'pending' for automatic analysis triggering.
    - Apply initial tags based on content type and project context.

4.  **Automatic Analysis Integration**
    - Detect content type and trigger appropriate analysis tasks:
      - **Video content**: Route to video analysis workflow.
      - **Document content**: Route to document analysis workflow.
      - **Transcript content**: Route to transcript analysis workflow.
    - Use the active project context for seamless workflow integration.
    - Update project metadata with new source count and analysis queue status.

5.  **Source Organization and Metadata**
    - Apply automatic categorization based on content type and analysis results.
    - Suggest relevant tags based on project theme and existing source patterns.

6.  **Validation and Confirmation**
    - Verify source addition to the project's sources registry was successful.
    - Confirm automatic analysis tasks were queued appropriately.
    - Display a summary of the added source with next steps.
    - Update project metadata counters (`references_count`).

## Elicitation Requirements

elicit: true
format: |
Please specify:

    **Project Context (Optional):**

    - Should this source be added to a specific research project? (Leave blank to use active project context)
    - If yes, what is the project name? (Must match an existing project from project-list)

    **Source Information:**

    - What is the source URL or local file path to add?
    - Any specific title or description to override automatic detection?

    **Source Organization:**

    - Any specific tags or categories for this source?
    - Any relationships to existing sources in this or other projects?

    **Analysis Preferences:**

    - Should automatic analysis be triggered immediately?
    - Any specific analysis focus?

    **Deduplication Handling:**

    - If a duplicate source is detected, what is the preferred action (skip, cross-reference, update)?

## Output Requirements

**Source Addition Success:**

- Confirmation of source added to project with unique identifier.
- Source metadata summary: type, title, URL, fingerprint, version.
- Analysis status and automatic task triggering confirmation.
- Duplicate detection results and actions taken.

**Source Registry Updates:**

- Source added to `.bmad/projects/{project-name}/config/sources.json`.
- (Future - Phase 3) Global source index updated in `.bmad/config/source-index.json`.
- Project metadata updated with incremented `references_count`.

**Analysis Integration:**

- Automatic analysis tasks queued based on content type detection.
- Active project context applied automatically for seamless workflow.

**Next Steps Guidance:**

- Recommended follow-up actions based on source type and project context.
- Timeline for automatic analysis completion and result availability.

**Error Handling:**

- Clear messages for invalid URLs, inaccessible sources, or format issues.
- Guidance for resolving duplicate source conflicts.
- Fallback instructions for manual source addition when automatic detection fails.
