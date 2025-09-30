# project-search

## Task Overview

Discover and search research materials across all projects with advanced filtering, ranking, and cross-project awareness for comprehensive research material management and reuse.

## Instructions

1. **Search Scope and Context**
   - Search across all project sources registries and global source index
   - Apply project isolation rules while enabling cross-project discovery when appropriate
   - Use active project context from Story 1.3 to prioritize results from current project
   - Handle both focused project searches and comprehensive cross-project discovery

2. **Search Query Processing**
   - Support multiple search modes: text search, tag-based search, metadata search, URL search
   - Parse search queries with support for boolean operators (AND, OR, NOT)
   - Process content type filters (video, document, transcript, external-source)
   - Handle date range searches and analysis status filtering (pending, analyzing, completed, archived)

3. **Advanced Filtering System**
   - **Content Type Filtering**: Filter by video, document, transcript, external-source
   - **Analysis Status Filtering**: Filter by pending, analyzing, completed, archived
   - **Date Range Filtering**: Filter by added_date or last_modified within specified ranges
   - **Tag-Based Filtering**: Include/exclude sources with specific tags or tag combinations
   - **Project Filtering**: Search within specific projects or exclude certain projects
   - **Collection Filtering**: Filter by source collection membership for organized discovery

4. **Search Result Ranking**
   - **Relevance Ranking**: Score results based on search term match strength and frequency
   - **Recency Ranking**: Prioritize recently added or modified sources
   - **Analysis Completion**: Higher ranking for sources with completed analysis
   - **Project Context**: Boost results from active project when project context available
   - **Cross-Reference Value**: Higher ranking for sources referenced across multiple projects

5. **Result Processing and Display**
   - Format search results with consistent BMAD task output patterns
   - Display source metadata: title, type, project, tags, analysis status, last modified
   - Include relevance scores and ranking explanations for transparency
   - Show cross-project references and relationships for comprehensive research context
   - Provide direct file paths for immediate access to transcripts and analysis results

6. **Search Result Export**
   - Option to export search results to structured formats (JSON, CSV, Markdown)
   - Include all metadata and cross-references for external analysis
   - Create search result snapshots for research workflow integration
   - Support filtered exports based on result ranking and selection criteria

## Elicitation Requirements

elicit: true
format: |
Please specify:

**Search Query:**

- What are you searching for? (keywords, phrases, URLs, or content descriptions)
- Should this be exact match or fuzzy search?
- Any specific boolean operators or complex search patterns?

**Search Scope:**

- Search within specific projects only, or across all projects?
- Include active project context for result prioritization?
- Any projects to exclude from search results?

**Content Filtering:**

- Specific content types to include? (video, document, transcript, external-source)
- Analysis status preference? (pending, analyzing, completed, archived, any)
- Date range for source addition or modification?

**Tag and Organization Filters:**

- Any specific tags to include or exclude?
- Search within specific source collections?
- Include cross-referenced sources from other projects?

**Result Preferences:**

- How many results to display? (default: 20)
- Preferred ranking method? (relevance, recency, analysis completion)
- Include result export options?
- Show cross-project relationships and references?

## Output Requirements

**Search Results Display:**

- Formatted list of matching sources with key metadata and relevance scores
- Source information: title, type, project location, tags, analysis status
- Cross-project references and relationships for comprehensive research context
- Direct file paths for accessing transcripts, analysis results, and source materials

**Search Result Metadata:**

- Total number of results found across all searched projects
- Search execution time and performance metrics
- Applied filters and ranking methodology explanation
- Cross-project distribution summary for research scope understanding

**Search Result Organization:**

- Group results by project, content type, or relevance score as requested
- Highlight sources from active project context for immediate relevance
- Show source relationships and cross-references for research trail discovery
- Include source collection memberships for organized material grouping

**File Access Information:**

- **Source Files**: Direct paths to `projects/{project-name}/references/` for source materials
- **Analysis Files**: Paths to `projects/{project-name}/analyses/` for completed analysis reports
- **Transcript Files**: Paths to transcript files for immediate content access
- **Metadata Files**: Paths to source configuration files for detailed metadata

**Cross-Project Discovery:**

- Sources referenced across multiple projects with cross-reference details
- Duplicate source detection results showing canonical and reference locations
- Related source suggestions based on content similarity and tagging
- Research trail connections showing source relationships and dependencies

**Export Capabilities:**

- JSON export with complete metadata and cross-references for external analysis
- CSV export for spreadsheet analysis and research workflow integration
- Markdown export for documentation and research note integration
- Filtered exports based on user selection and ranking preferences

**Performance and Context:**

- Search completion time and efficiency metrics for large source collections
- Active project context integration showing prioritized results
- Search history and suggestion capabilities for repeated research patterns
- Integration guidance for using search results in analysis and content creation workflows

**Error Handling:**

- Clear messages for no results found or invalid search parameters
- Guidance for refining search queries and filters for better results
- Fallback suggestions when search scope is too narrow or broad
- Help text for using advanced search features and boolean operators

**Next Steps Guidance:**

- Suggested actions based on search results (analyze sources, create collections, cross-reference)
- Recommendations for expanding or refining research based on discovered materials
- Integration tips for using found sources in current project workflows
