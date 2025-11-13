# project-search

## Task Overview

Discover and search research materials across all projects with advanced filtering, ranking, and cross-project awareness for comprehensive research material management and reuse.

## Instructions

1.  **Search Scope and Context**
    -   Search across all project sources registries.
    -   (Future - Phase 3) Use a global source index for cross-project discovery.
    -   Apply project isolation rules while enabling cross-project discovery when appropriate.
    -   Use the active project context to prioritize results from the current project.

2.  **Search Query Processing**
    -   Support multiple search modes: text search, tag-based search, metadata search, URL search.
    -   Parse search queries with support for boolean operators (AND, OR, NOT).
    -   Process content type filters (video, document, transcript, external-source).
    -   Handle date range searches and analysis status filtering.

3.  **Advanced Filtering System**
    -   **Content Type Filtering**: Filter by video, document, transcript, etc.
    -   **Analysis Status Filtering**: Filter by pending, analyzing, completed, archived.
    -   **Date Range Filtering**: Filter by date added or last modified.
    -   **Tag-Based Filtering**: Include/exclude sources with specific tags.
    -   **Project Filtering**: Search within specific projects or exclude projects.

4.  **Search Result Ranking**
    -   **Relevance Ranking**: Score results based on search term match strength.
    -   **Recency Ranking**: Prioritize recently added or modified sources.
    -   **Analysis Completion**: Higher ranking for sources with completed analysis.
    -   **Project Context**: Boost results from the active project.

5.  **Result Processing and Display**
    -   Format search results consistently.
    -   Display source metadata: title, type, project, tags, analysis status, last modified.
    -   Include relevance scores for transparency.
    -   Provide direct file paths for immediate access to materials.

6.  **Search Result Export**
    -   Provide an option to export search results to structured formats (JSON, CSV, Markdown).
    -   Include all metadata for external analysis.

## Elicitation Requirements

elicit: true
format: |
    Please specify:

    **Search Query:**

    - What are you searching for? (keywords, phrases, URLs, etc.)
    - Should this be an exact match or fuzzy search?

    **Search Scope:**

    - Search within specific projects only, or across all projects?
    - Any projects to exclude from search results?

    **Content Filtering:**

    - Specific content types to include? (video, document, transcript, etc.)
    - Analysis status preference? (pending, analyzing, completed, etc.)
    - Date range for source addition or modification?

    **Tag and Organization Filters:**

    - Any specific tags to include or exclude?

    **Result Preferences:**

    - How many results to display? (default: 20)
    - Preferred ranking method? (relevance, recency)
    - Include result export options?

## Output Requirements

**Search Results Display:**

-   Formatted list of matching sources with key metadata and relevance scores.
-   Source information: title, type, project location, tags, analysis status.
-   Direct file paths for accessing source materials.

**Search Result Metadata:**

-   Total number of results found.
-   Search execution time.
-   Applied filters and ranking methodology explanation.

**File Access Information:**

-   **Source Files**: Direct paths to `.bmad/projects/{project-name}/references/` for source materials.
-   **Analysis Files**: Paths to `.bmad/projects/{project-name}/analyses/` for completed analysis reports.

**Export Capabilities:**

-   JSON, CSV, and Markdown export options.

**Error Handling:**

-   Clear messages for no results found or invalid search parameters.
-   Guidance for refining search queries.
