# distill-wisdom

## Task Overview

Extract surprising, insightful, and interesting information from text content. Following the research and writing focus you were provided, find related insights in content provided to you.

## Instructions

Take a step back and think step-by-step about how to achieve the best possible results by following the steps below.

# STEPS

- Obtain the material to review. This should be content already prepared for analysis:
  - A pre-saved transcript from appropriate directory based on project context:
    - **Project context provided**: Look in `projects/{project-name}/references/`
    - **No project context**: Look in global `references/transcripts/` directory
  - A file saved in the local directory `references/` to be read
  - A document file provided by the user
    IMPORTANT: This task works with already-prepared content. For YouTube videos, use save-transcript task first to download and classify content before running this analysis.

- Extract a summary of the content in 25 words, including who is presenting and the content being discussed for a section called SUMMARY.

- Extract 10 to 20 of the best insights from the input and from a combination of the raw input and the IDEAS above for a section called INSIGHTS. These INSIGHTS should be fewer, more refined, more insightful, and more abstracted versions of the best ideas in the content.

- Extract 15 to 30 of the most surprising, insightful, and/or interesting quotes from the input for a section called QUOTES. Use the exact quote text from the input. Include the name of the speaker of the quote at the end.

- Extract 15 to 30 of the most practical and useful personal habits of the speakers, or mentioned by the speakers, in the content for a section called HABITS. Examples include but aren't limited to: sleep schedule, reading habits, things they always do, things they always avoid, productivity tips, diet, exercise, etc.

- Extract 15 to 30 of the most surprising, insightful, and/or interesting valid facts about the greater world that were mentioned in the content for a section called FACTS.

- Extract all mentions of writing, art, tools, projects and other sources of inspiration mentioned by the speakers for a section called REFERENCES. This should include any and all references to something that the speaker mentioned.

- Extract the most potent takeaway and recommendation for a section called ONE-SENTENCE TAKEAWAY. This should be a 15-word sentence that captures the most important essence of the content.

- Extract the 15 to 30 of the most surprising, insightful, and/or interesting recommendations that can be collected from the content for a section called RECOMMENDATIONS.

## Elicitation Requirements

elicit: true
format: |
Please specify:

**Project Context (Optional):**

- Should this analysis be associated with a specific research project? (Leave blank for standalone analysis)
- If yes, what is the project name? (Must match an existing project from project-list)

**Analysis Subject:**

- What source is available for the analysis?

## Output Requirements

- Only output Markdown.
- CRITICAL: Always save research output in a single file (content-distillation-report) that can be used by other agents
- CRITICAL: Route output based on project context:
  - **Project context provided**: Save to `projects/{project-name}/analyses/content-distillation-report-{YYYY-MM-DD}.md`
  - **No project context**: Save to existing location (content-distillation-report)
- CRITICAL: Update project metadata `analyses_completed` array when saving to project location
- CRITICAL: DO NOT put anything in output to the user that is not preserved in a file: we do not want to lose any context
- Write the IDEAS bullets as exactly 16 words.
- Write the RECOMMENDATIONS bullets as exactly 16 words.
- Write the HABITS bullets as exactly 16 words.
- Write the FACTS bullets as exactly 16 words.
- Write the INSIGHTS bullets as exactly 16 words.
- Extract at least 25 IDEAS from the content.
- Extract at least 10 INSIGHTS from the content.
- Extract at least 20 items for the other output sections.
- Do not give warnings or notes; only output the requested sections.
- You use bulleted lists for output, not numbered lists.
- Do not repeat ideas, insights, quotes, habits, facts, or references from the input being analyzed.
- Do not start items with the same opening words.
- Ensure you follow ALL these instructions when creating your output.
