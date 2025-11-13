# distill-wisdom

## Task Overview

Extract surprising, insightful, and interesting information from text content following structured wisdom extraction methodology to capture insights, quotes, habits, facts, references, and recommendations for content creation and research purposes.

## Instructions

Take a step back and think step-by-step about how to achieve the best possible results by following the steps below.

### 1. Content Acquisition

Obtain the material to review. This should be content already prepared for analysis:

- **Pre-saved transcript** from appropriate directory based on project context:
  - **Project context provided**: Look in `projects/{project-name}/references/`
  - **No project context**: Look in global `references/transcripts/` directory
- **File saved locally** in the `references/` directory to be read
- **Document file** provided by the user

**IMPORTANT**: This task works with already-prepared content. For YouTube videos, use save-transcript task first to download and classify content before running this analysis.

### 2. Summary Extraction

Extract a summary of the content in 25 words, including who is presenting and the content being discussed for a section called **SUMMARY**.

### 3. Ideas Extraction

Extract 25+ of the most interesting ideas from the input in a section called **IDEAS**. These should capture the raw concepts, theories, and thoughts presented.

- Write each idea as exactly 16 words
- Capture the speaker's concepts in accessible language
- Include a variety of topics and themes

### 4. Insights Distillation

Extract 10 to 20 of the best insights from the input and from a combination of the raw input and the IDEAS above for a section called **INSIGHTS**. These INSIGHTS should be fewer, more refined, more insightful, and more abstracted versions of the best ideas in the content.

- Write each insight as exactly 16 words
- Focus on deeper understanding and abstraction
- Capture surprising or non-obvious connections

### 5. Quotes Extraction

Extract 15 to 30 of the most surprising, insightful, and/or interesting quotes from the input for a section called **QUOTES**.

- Use the exact quote text from the input
- Include the name of the speaker at the end of each quote
- Select quotes that are memorable, powerful, or revealing

### 6. Habits Extraction

Extract 15 to 30 of the most practical and useful personal habits of the speakers, or mentioned by the speakers, in the content for a section called **HABITS**.

- Write each habit as exactly 16 words
- Examples include: sleep schedule, reading habits, things they always do, things they always avoid, productivity tips, diet, exercise, routines
- Focus on actionable personal practices

### 7. Facts Extraction

Extract 15 to 30 of the most surprising, insightful, and/or interesting valid facts about the greater world that were mentioned in the content for a section called **FACTS**.

- Write each fact as exactly 16 words
- Include verifiable information about the world, science, history, society
- Select facts that are surprising or educational

### 8. References Extraction

Extract all mentions of writing, art, tools, projects and other sources of inspiration mentioned by the speakers for a section called **REFERENCES**.

- Include any and all references to something that the speaker mentioned
- List books, articles, tools, software, people, organizations, artwork, etc.
- Provide enough detail to locate the reference

### 9. One-Sentence Takeaway

Extract the most potent takeaway and recommendation for a section called **ONE-SENTENCE TAKEAWAY**.

- This should be a 15-word sentence that captures the most important essence of the content

### 10. Recommendations Extraction

Extract 15 to 30 of the most surprising, insightful, and/or interesting recommendations that can be collected from the content for a section called **RECOMMENDATIONS**.

- Write each recommendation as exactly 16 words
- Focus on actionable advice and suggestions
- Include recommendations for thinking, acting, or approaching problems

## Elicitation Requirements

elicit: true
format: |
  Please specify:

  **Project Context (Optional):**

  - Should this analysis be associated with a specific research project? (Leave blank for standalone analysis)
  - If yes, what is the project name? (Must match an existing project from project-list)

  **Analysis Subject:**

  - What source is available for the analysis? (file path, transcript location, or document)
  - Any specific focus areas or themes to emphasize?

## Output Requirements

### Format Specifications

- Only output Markdown
- Use bulleted lists for output, not numbered lists
- Do not repeat ideas, insights, quotes, habits, facts, or references
- Do not start items with the same opening words
- Do not give warnings or notes; only output the requested sections

### Content Requirements

- Extract at least 25 IDEAS from the content
- Extract at least 10 INSIGHTS from the content
- Extract at least 20 items for QUOTES, HABITS, FACTS, and RECOMMENDATIONS sections
- Write IDEAS bullets as exactly 16 words
- Write INSIGHTS bullets as exactly 16 words
- Write HABITS bullets as exactly 16 words
- Write FACTS bullets as exactly 16 words
- Write RECOMMENDATIONS bullets as exactly 16 words
- ONE-SENTENCE TAKEAWAY should be exactly 15 words
- SUMMARY should be exactly 25 words

### File Saving Requirements

- **CRITICAL**: Always save research output in a single file (content-distillation-report) that can be used by other agents
- **CRITICAL**: Route output based on project context:
  - **Project context provided**: Save to `projects/{project-name}/analyses/content-distillation-report-{YYYY-MM-DD}.md`
  - **No project context**: Save to `content-distillation-report-{YYYY-MM-DD}.md` in appropriate location
- **CRITICAL**: Update project metadata `analyses_completed` array when saving to project location
- **CRITICAL**: DO NOT put anything in output to the user that is not preserved in a file - we do not want to lose any context

### Report Structure

The output file should contain these sections in order:

1. SUMMARY
2. IDEAS
3. INSIGHTS
4. QUOTES
5. HABITS
6. FACTS
7. REFERENCES
8. ONE-SENTENCE TAKEAWAY
9. RECOMMENDATIONS
