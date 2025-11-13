# analyze-video-content

## Task Overview

Analyze YouTube video content by first saving the transcript locally, then performing appropriate content analysis (debate analysis or wisdom distillation) based on content type, with all results consolidated in a single report.

## Instructions

1. **Transcript Acquisition**
   - If transcript not already saved, use save-transcript task to download and classify content
   - Locate existing transcript in appropriate directory based on project context:
     - **Project context provided**: Look in `projects/{project-name}/references/`
     - **No project context**: Look in global `references/transcripts/` directory
   - Note content type classification (debate vs. educational) for routing

2. **Content Type Routing**
   - **Debate Format**: Use debate-analyst methodology for argument analysis
   - **Educational Format**: Use content-analyst + distill-wisdom methodology
   - **Mixed Format**: Apply appropriate analysis to different segments

3. **Analysis Execution**
   - For debate content: Apply Damer's five criteria, identify fallacies, assess integrity
   - For educational content: Extract insights, quotes, habits, facts, recommendations
   - Include participant analysis and credibility assessment when relevant

4. **Consolidated Reporting**
   - Create single comprehensive report file
   - Include transcript metadata and source information
   - Combine analysis results with context for future reference
   - Route output based on project context:
     - **Project context provided**: Save to `projects/{project-name}/analyses/`
     - **No project context**: Save to global location as before
   - Save as content-analysis-report or content-distillation-report as appropriate

5. **Context Efficiency**
   - Reference transcript file path rather than embedding full content
   - Provide summary of key findings for quick reference
   - Enable reuse of analysis across multiple workflows

## Elicitation Requirements

elicit: true
format: |
  Please specify:

  **Project Context (Optional):**

  - Should this analysis be associated with a specific research project? (Leave blank for standalone analysis)
  - If yes, what is the project name? (Must match an existing project from project-list)

  **Video Source:**

  - What is the YouTube URL or transcript file to analyze?
  - Is this part of a larger research project or standalone analysis?
  - Any specific aspects to focus on (arguments, insights, participants)?

  **Analysis Preferences:**

  - Should this be comprehensive analysis or focused on specific elements?
  - Any particular audience or use case for the analysis?
  - Integration with other research or content creation workflows?

## Output Requirements

**Single Consolidated Report:**

- Transcript metadata and source information
- Content type and analysis methodology used
- Analysis results (debate analysis OR wisdom distillation)
- Key findings summary for quick reference
- Recommendations for follow-up analysis or content creation

**File Naming and Location:**

- **Project context provided**: Save to `projects/{project-name}/analyses/video-analysis-{YYYY-MM-DD}_{video-id}.md`
- **No project context**: Save to `docs/video-analysis-{YYYY-MM-DD}_{video-id}.md` (existing behavior)
- Include links to source transcript file for full context
- Update project metadata `analyses_completed` array when saving to project location

**Context Efficiency:**

- Analysis report stays under 3000 words for readability
- Reference transcript file for full content access
- Summary section for quick insights without reading full analysis
