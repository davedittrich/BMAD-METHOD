# save-transcript

## Task Overview

Download and save YouTube video transcripts to local files for efficient context management and reuse across multiple research workflows without consuming excessive context window space.

## Instructions

1. **Video Analysis**
   - Extract video ID from provided YouTube URL
   - Gather basic metadata (title, duration, publish date, channel)
   - Identify if participants/speakers are detectable in description or title

2. **Transcript Download**
   - Use available YouTube transcript tools to download transcript
   - Preserve timing information if available
   - Handle different transcript formats (auto-generated vs. manual)
   - Note transcript quality and source type

3. **Content Classification**
   - Quick analysis to determine content type:
     - Debate format (structured argument between participants)
     - Educational/informational (single speaker or interview)
     - Documentary/news (factual reporting)
     - Entertainment/casual (unstructured conversation)

4. **File Storage**
   - Route storage based on project context:
     - **Project context provided**: Save to `.bmad/projects/{project-name}/references/`
     - **No project context**: Save to global `.bmad/references/transcripts/` directory
   - Create target directory if it doesn't exist
   - Use naming convention: `YYYY-MM-DD_video-id_title-slug.md`
   - Include structured metadata header
   - Store full transcript content with timing markers if available
   - Update project metadata `references_count` when saving to project location

5. **Context-Efficient Response**
   - Return file path and basic metadata only
   - Do NOT include full transcript content in response
   - Provide content type classification for routing to appropriate analysis agents
   - Include participant names if detectable

## Elicitation Requirements

elicit: true
format: |
    Please specify:

    **Project Context (Optional):**

    - Should this transcript be associated with a specific research project? (Leave blank for standalone storage)
    - If yes, what is the project name? (Must match an existing project from project-list)

    **Video Source:**

    - What is the YouTube URL to download transcript from?
    - Are there specific participants or speakers to identify?
    - Is this part of a series or related to other content?

    **Storage Preferences:**

    - Any specific naming preferences for the saved file?
    - Should this be categorized with existing transcripts?

## Output Requirements

**File Structure:**

```markdown
# Video Transcript: [Title]

## Metadata

-   **URL:** [YouTube URL]
-   **Video ID:** [extracted ID]
-   **Title:** [full video title]
-   **Duration:** [length]
-   **Published:** [date]
-   **Channel:** [channel name]
-   **Content Type:** [debate/educational/documentary/entertainment]
-   **Participants:** [names if detectable]
-   **Transcript Source:** [auto-generated/manual/captions]
-   **Downloaded:** [current date]

## Transcript

[Full transcript content with timing if available]

---

_Saved using BMAD save-transcript task_
```

**Agent Response:**

-   File path where transcript was saved
-   Basic metadata (title, duration, content type)
-   Participant names if identified
-   Content type classification for routing recommendations
-   Brief quality assessment of transcript (clarity, timing accuracy)

**Context Efficiency Notes:**

-   Full transcript content stays in local file
-   Agents can read specific sections as needed
-   Eliminates context window consumption for transcript content
-   Enables reuse across multiple workflows and analysis sessions
