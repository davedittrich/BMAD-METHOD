# project-status

## Task Overview

Display comprehensive project progress overview with analysis inventory, file counts, recent activity, and context-aware recommendations for next research steps.

## Instructions

1. **Project Discovery and Validation**
   - Identify target project for status reporting
   - Use active project context if available, or allow manual project specification
   - Validate project exists and has proper directory structure and metadata

2. **Progress Metrics Collection**
   - Read project metadata from `projects/{project-name}/config/project.json`
   - Count files in each project directory (references, analyses, drafts)
   - Calculate project completion indicators and research scope metrics
   - Identify recent activity patterns and workflow trends

3. **Analysis Inventory Assessment**
   - List completed analyses in `projects/{project-name}/analyses/`
   - Show analysis types, completion dates, and output file sizes
   - Identify analysis gaps or recommended follow-up investigations
   - Track analysis workflow patterns and research progression

4. **Context-Aware File Discovery**
   - Scan project directories for available materials and sources
   - Categorize content types (transcripts, analyses, drafts, references)
   - Show file relationships and dependencies for workflow planning
   - Identify orphaned or underutilized project materials

5. **Research Recommendations and Next Steps**
   - Based on project progress, suggest next logical research actions
   - Recommend analysis tasks for available but unprocessed materials
   - Identify workflow optimization opportunities
   - Provide guidance on project organization and content management

6. **Activity Timeline and Recent Changes**
   - Show recent file modifications and additions
   - Track project evolution and research momentum
   - Identify inactive periods and suggest reactivation strategies
   - Display project timeline for progress visualization

## Elicitation Requirements

elicit: true
format: |
Please specify:

**Project Selection:**

- Which project should be analyzed for status? (Leave blank to use active project context)
- If no active context, what is the project name? (Must match an existing project from project-list)

**Status Detail Level:**

- Do you want a summary overview or detailed breakdown?
- Should file listings include individual file details?
- Any specific aspects to focus on (progress, recommendations, file inventory)?

**Context and Planning:**

- Are you planning next research actions or reviewing overall progress?
- Should recommendations focus on specific research methodology or general workflow?
- Any particular deadline or milestone to optimize recommendations for?

## Output Requirements

**Project Overview Section:**
- Project name, description, and creation date
- Current status and research phase identification
- Overall progress indicators and completion metrics
- Active context status (if this project is currently active)

**File Inventory and Metrics:**
- File counts by directory: references (X files), analyses (Y files), drafts (Z files)
- Total project scope and material volume indicators
- Recent activity summary (files added/modified in last 7/30 days)
- Storage utilization and project size information

**Analysis Completion Dashboard:**
- List of completed analyses with dates and types
- Analysis workflow patterns and research progression
- Identified analysis gaps or missing investigations
- Recommended follow-up analyses based on available materials

**Context-Aware File Discovery:**
- Available materials by category (transcripts, documents, sources)
- File relationships and cross-references for workflow planning
- Underutilized materials and optimization opportunities
- Quick access paths to key project files

**Research Recommendations:**
- Next suggested research actions based on current project state
- Specific task recommendations (analyze-video-content, distill-wisdom, etc.)
- Workflow optimization suggestions for research efficiency
- Project organization and content management guidance

**Activity Timeline:**
- Recent project activity (last 30 days)
- File modification and addition patterns
- Project momentum indicators and research velocity
- Suggestions for maintaining research continuity

**Navigation and Quick Actions:**
- File paths for direct access to key project materials
- Command suggestions for immediate next steps
- Context switching guidance if project not currently active
- Integration tips for using project context with enhanced tasks

**Performance Metrics:**
- Status generation completed in <3 seconds
- Comprehensive project analysis without performance impact
- Scalable reporting for projects with large file inventories
- Memory-efficient processing for extensive project collections
