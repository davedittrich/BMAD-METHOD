# project-status

## Task Overview

Display comprehensive project progress overview with enhanced lifecycle management, analysis inventory, archive status, cross-project relationships, and context-aware recommendations for next research steps.

## Instructions

1. **Project Discovery and Validation**
   - Identify target project for status reporting
   - Use active project context if available, or allow manual project specification
   - Validate project exists and has proper directory structure and metadata

2. **Enhanced Lifecycle Status Assessment**
   - Read project metadata from `projects/{project-name}/config/project.json` with lifecycle information
   - Display current project status: active, review, completed, archived
   - Show lifecycle history with status transitions, dates, and reasons
   - Assess project readiness for lifecycle progression and archive eligibility

3. **Progress Metrics Collection**
   - Count files in each project directory (references, analyses, drafts)
   - Calculate project completion indicators and research scope metrics
   - Identify recent activity patterns and workflow trends
   - Track project size and storage utilization metrics

4. **Cross-Project Relationship Status**
   - Display project relationships from `projects/{project-name}/config/relationships.json`
   - Show relationship types, strength indicators, and collaboration status
   - Validate cross-project reference integrity and health monitoring
   - Report on collaboration spaces and shared resource participation

5. **Archive and Lifecycle Information**
   - Show archive eligibility and readiness assessment for project lifecycle management
   - Display restoration history if project was previously archived
   - Report on archive health and backup status if applicable
   - Provide lifecycle transition recommendations and next steps guidance

6. **Analysis Inventory Assessment**
   - List completed analyses in `projects/{project-name}/analyses/`
   - Show analysis types, completion dates, and output file sizes
   - Identify analysis gaps or recommended follow-up investigations
   - Track analysis workflow patterns and research progression

7. **Context-Aware File Discovery**
   - Scan project directories for available materials and sources
   - Categorize content types (transcripts, analyses, drafts, references)
   - Show file relationships and dependencies for workflow planning
   - Identify orphaned or underutilized project materials

8. **Research Recommendations and Next Steps**
   - Based on project progress and lifecycle status, suggest next logical research actions
   - Recommend analysis tasks for available but unprocessed materials
   - Identify workflow optimization opportunities and lifecycle progression options
   - Provide guidance on project organization, cross-project collaboration, and archive readiness

9. **Activity Timeline and Recent Changes**
   - Show recent file modifications and additions with lifecycle context
   - Track project evolution and research momentum across lifecycle phases
   - Identify inactive periods and suggest reactivation or archival strategies
   - Display project timeline with lifecycle transitions and relationship development

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

**Enhanced Project Overview Section:**

- Project name, description, and creation date with lifecycle information
- Current project status: active, review, completed, archived
- Lifecycle history with status transitions, dates, and transition reasons
- Archive eligibility and readiness assessment for lifecycle progression
- Active context status and cross-project relationship participation

**File Inventory and Metrics:**

- File counts by directory: references (X files), analyses (Y files), drafts (Z files)
- Total project scope and material volume indicators
- Recent activity summary (files added/modified in last 7/30 days)
- Storage utilization and project size information

**Cross-Project Relationship Status:**

- Project relationships with types, strength, and collaboration status
- Dependency graph participation and relationship health monitoring
- Collaboration space participation and shared resource access
- Cross-project reference integrity and validation results

**Archive and Lifecycle Management:**

- Archive status and restoration history if applicable
- Archive health monitoring and backup status reporting
- Lifecycle transition recommendations and next steps guidance
- Storage optimization and archive readiness assessment

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

**Enhanced Research Recommendations:**

- Next suggested research actions based on current project state and lifecycle status
- Specific task recommendations with lifecycle and cross-project context
- Workflow optimization suggestions including archive readiness and relationship management
- Project organization, cross-project collaboration, and lifecycle progression guidance

**Activity Timeline with Lifecycle Context:**

- Recent project activity with lifecycle transition events
- File modification patterns and relationship development history
- Project momentum indicators and research velocity across lifecycle phases
- Suggestions for maintaining research continuity, collaboration, or archive preparation

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
