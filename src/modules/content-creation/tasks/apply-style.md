# apply-style

## Task Overview

Apply a previously analyzed style profile to new or existing content, providing real-time guidance to match voice, tone, structure, and linguistic patterns of the target style.

## Instructions

1. **Voice and Tone Application**
   - Guide tone adjustments to match target style (formal, casual, authoritative, etc.)
   - Help replicate personality traits from style profile
   - Adjust emotional register and expression patterns
   - Match directness level vs. diplomatic language
   - Ensure consistent narrative perspective (first/second/third person)

2. **Sentence Structure Matching**
   - Guide sentence structure to match target patterns (simple, complex, compound)
   - Adjust sentence length to match style profile averages and variation
   - Replicate rhythm and pacing preferences
   - Match punctuation patterns (em-dashes, semicolons, etc.)
   - Apply structural preferences from profile

3. **Vocabulary and Diction Alignment**
   - Guide word choice to match formality level
   - Suggest vocabulary that aligns with target style
   - Help incorporate characteristic phrases or expressions
   - Match jargon and specialized terminology usage patterns
   - Align complexity level with target reading grade

4. **Paragraph and Document Structure**
   - Apply paragraph organization patterns from profile
   - Match typical paragraph lengths
   - Replicate transition patterns and connecting phrases
   - Apply structural elements (lists, headers, quotes) as per style
   - Match overall pacing and flow preferences

5. **Rhetorical Device Application**
   - Guide use of metaphors, analogies matching target style
   - Match patterns of question usage
   - Apply humor, irony, wit patterns appropriately
   - Replicate storytelling and narrative techniques
   - Use repetition and emphasis techniques as per profile

6. **Grammar and Mechanics Consistency**
   - Apply punctuation preferences from profile
   - Match active/passive voice ratio
   - Replicate grammar quirks or consistent choices
   - Apply capitalization and formatting preferences
   - Ensure mechanical consistency throughout

7. **Content Organization**
   - Apply typical article structure from profile
   - Match opening and closing techniques
   - Replicate argument development patterns
   - Apply characteristic use of examples and evidence
   - Balance exposition, analysis, storytelling as per style

8. **Real-Time Adjustments**
   - Provide specific rewrites for style mismatches
   - Suggest alternative phrasings aligned with profile
   - Alert to style deviations with corrections
   - Offer examples from style profile for comparison
   - Guide iterative refinement toward target style

## Elicitation Requirements

elicit: true
format: |
Please provide:

**Style Profile:**

- Which style profile should be applied? (provide profile name or file path)
- Was this profile generated from the analyze-style task?
- Are there specific style elements to prioritize or ignore?

**Content to Style:**

- What content needs style application? (provide text or file path)
- Is this new content or revision of existing content?
- What sections or paragraphs need styling?

**Application Scope:**

- Should this be a comprehensive restyle or targeted adjustments?
- Are there elements that should NOT be changed (quotes, technical terms, etc.)?
- What is the acceptable tolerance for style matching (strict vs. flexible)?

## Output Requirements

Provide style application guidance including:

- Specific rewrites and edits to match target style profile
- Before/after examples showing style transformations
- Alerts to significant style deviations with corrections
- Quantitative metrics showing alignment (sentence length, vocabulary level, etc.)
- Explanation of key style adjustments made
- Recommendations for maintaining style consistency
- Comparison to style profile examples for validation
- Overall style matching score or assessment
