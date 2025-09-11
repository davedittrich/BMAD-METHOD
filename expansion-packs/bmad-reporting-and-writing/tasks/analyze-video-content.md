# analyze-video-content

## Task Overview

Analyze YouTube video content by first saving the transcript locally, then performing appropriate content analysis (debate analysis or wisdom distillation) based on content type, with all results consolidated in a single report.

## Instructions

1. **Transcript Acquisition**
   - If transcript not already saved, use save-transcript task to download and classify content
   - Locate existing transcript in `references/transcripts/` directory if available
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
   - Save as content-analysis-report or content-distillation-report as appropriate

5. **Context Efficiency**
   - Reference transcript file path rather than embedding full content
   - Provide summary of key findings for quick reference
   - Enable reuse of analysis across multiple workflows

## Elicitation Requirements

elicit: true
format: |
Please specify:

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

**File Naming:**
- `docs/video-analysis-{YYYY-MM-DD}_{video-id}.md` (using today's date) for comprehensive reports
- Include links to source transcript file for full context

**Context Efficiency:**
- Analysis report stays under 3000 words for readability
- Reference transcript file for full content access
- Summary section for quick insights without reading full analysis

