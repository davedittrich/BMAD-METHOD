# distill-wisdom

## Task Overview

Extract surprising, insightful, and interesting information from text content. Following the research and writing focus you were provided, find related insights in content provided to you.

## Instructions

Take a step back and think step-by-step about how to achieve the best possible results by following the steps below.

# STEPS

- Obtain the material to review.  This may come from:
  - A file saved in the local directory `references/` to be read
  - A remote file or video specified by a URL:
    - Fetch PDF or other document files
    - Download YouTube video transcripts with `yt-dlp --cookies-from-browser brave --restrict-filenames ...
  IMPORTANT: save the material and any metadata you retrieved in a file in the `references/` directory so it can be reused without downloading again.

- Extract a summary of the content in 25 words, including who is presenting and the content being discussed for a section called SUMMARY.

- Extract 10 to 20 of the best insights from the input and from a combination of the raw input and the IDEAS above for a section called INSIGHTS. These INSIGHTS should be fewer, more refined, more insightful, and more abstracted versions of the best ideas in the content.

- Extract 15 to 30 of the most surprising, insightful, and/or interesting quotes from the input for a section called QUOTES. Use the exact quote text from the input. Include the name of the speaker of the quote at the end.

- Extract 15 to 30 of the most practical and useful personal habits of the speakers, or mentioned by the speakers, in the content for a section called HABITS. Examples include but aren't limited to: sleep schedule, reading habits, things they always do, things they always avoid, productivity tips, diet, exercise, etc.

- Extract 15 to 30 of the most surprising, insightful, and/or interesting valid facts about the greater world that were mentioned in the content for a section called FACTS.

- Extract all mentions of writing, art, tools, projects and other sources of inspiration mentioned by the speakers for a section called REFERENCES. This should include any and all references to something that the speaker mentioned.

- Extract the most potent takeaway and recommendation for a section called ONE-SENTENCE TAKEAWAY. This should be a 15-word sentence that captures the most important essence of the content.

- Extract the 15 to 30 of the most surprising, insightful, and/or interesting recommendations that can be collected from the content for a section called RECOMMENDATIONS.

## Elicitation Requirements

elicit: false
format: |
Please specify:

**Analysis Subject:**

- What source is available for the analysis?

## Output Requirements

- Only output Markdown.
- CRITICAL: Always save research output in a single file (content-distillation-report) that can be used by other agents
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


