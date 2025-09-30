# project-add-source

## Task Overview

Add new research materials to projects with intelligent deduplication, automatic content type detection, and seamless integration with existing analysis workflows for iterative research building.

## Instructions

1. **Source Validation and Processing**
   - Validate source URL format and accessibility for videos, documents, and external sources
   - Perform automatic content type detection: video, document, transcript, external-source
   - Extract source metadata: title, publish date, content description, duration (videos)
   - Generate content fingerprint for deduplication detection using URL normalization and metadata hash

2. **Intelligent Deduplication System**
   - Check existing sources across all projects using canonical URL matching
   - Perform content fingerprint comparison to detect duplicate materials with different URLs
   - Present deduplication options: skip duplicate, create cross-reference, update existing source
   - Maintain cross-project reference tracking in global source index
   - Update source relationship mapping when duplicates detected

3. **Source Addition to Project**
   - Add source to project-specific sources registry with complete metadata
   - Initialize source with version 1.0 and current timestamp
   - Set analysis_status to 'pending' for automatic analysis triggering
   - Apply initial tags based on content type and project context
   - Create source history entry for creation event

4. **Automatic Analysis Integration**
   - Detect content type and trigger appropriate enhanced tasks from Story 1.2:
     - **Video content**: Automatically trigger analyze-video-content task
     - **Document content**: Route to appropriate document analysis workflow
     - **Transcript content**: Process with distill-wisdom task if educational
     - **External sources**: Add to references with manual analysis option
   - Use active project context from Story 1.3 for seamless workflow integration
   - Update project metadata with new source count and analysis queue status

5. **Source Organization and Metadata**
   - Apply automatic categorization based on content type and analysis results
   - Suggest relevant tags based on project theme and existing source patterns
   - Create source collection memberships for grouping related materials
   - Initialize source relationships and cross-references for future discovery
   - Update project status and recommendations based on new source additions

6. **Validation and Confirmation**
   - Verify source addition to project sources registry successfully
   - Confirm automatic analysis tasks queued appropriately
   - Display source addition summary with next steps and analysis timeline
   - Update project metadata counters (references_count) for accurate project status

## Elicitation Requirements

elicit: true
format: |
Please specify:

**Project Context (Optional):**

- Should this source be added to a specific research project? (Leave blank to use active project context)
- If yes, what is the project name? (Must match an existing project from project-list)

**Source Information:**

- What is the source URL or local file path to add?
- Is this a YouTube video, document, transcript, or external source?
- Any specific title or description to override automatic detection?

**Source Organization:**

- Any specific tags or categories for this source?
- Should this source be part of a particular collection or group?
- Any relationships to existing sources in this or other projects?

**Analysis Preferences:**

- Should automatic analysis be triggered immediately?
- Any specific analysis focus (debate analysis, wisdom distillation, content summary)?
- Integration with existing research workflow or future content creation?

**Deduplication Handling:**

- If duplicate source detected, preferred action (skip, cross-reference, update)?
- Should cross-project references be created for related research?

## Output Requirements

**Source Addition Success:**

- Confirmation of source added to project with unique identifier
- Source metadata summary: type, title, URL, fingerprint, version
- Analysis status and automatic task triggering confirmation
- Cross-project duplicate detection results and actions taken

**Source Registry Updates:**

- Source added to `projects/{project-name}/config/sources.json` following Enhanced Source Reference Model
- Global source index updated in `config/source-index.json` for deduplication tracking
- Project metadata updated with incremented references_count and analysis queue status

**Analysis Integration:**

- Automatic analysis tasks queued based on content type detection
- Integration with Story 1.2 enhanced tasks (analyze-video-content, distill-wisdom, save-transcript)
- Project context from Story 1.3 applied automatically for seamless workflow

**Source Organization:**

- Initial tags and categorization applied based on content analysis
- Source collection memberships created for related material grouping
- Cross-references established for duplicate or related sources across projects

**Next Steps Guidance:**

- Recommended follow-up actions based on source type and project context
- Timeline for automatic analysis completion and result availability
- Suggestions for additional related sources or research directions

**Error Handling:**

- Clear messages for invalid URLs, inaccessible sources, or format issues
- Guidance for resolving duplicate source conflicts and cross-referencing options
- Fallback instructions for manual source addition when automatic detection fails

**File Operations:**

- Source metadata storage in project-specific and global configuration files
- Integration with existing project directory structure from Story 1.1
- Compatibility with enhanced task routing and project context management

**Performance Requirements:**

- Source addition and deduplication check complete in <10 seconds
- Minimal impact on project listing and status reporting performance
- Efficient cross-project duplicate detection without full content analysis
