# Adapt for Social Media Workflow Instructions

<workflow>

<critical>The workflow execution engine is governed by: {project-root}/bmad/core/tasks/workflow.xml</critical>
<critical>You MUST have already loaded and processed: {project-root}/src/modules/content-creation/workflows/adapt-for-social-media/workflow.yaml</critical>

<step n="1" goal="Get source content">
  <ask>Please provide the content you would like to adapt for social media. You can:
  A) Paste article text directly
  B) Provide a file path to an article
  C) Provide a video file or video script
  D) Use content from a recent workflow (research-article, create-video-assets)</ask>

  <check if="option_A">
    <ask>Please paste your article text.</ask>
    <template-output>source_content</template-output>
  </check>

  <check if="option_B">
    <ask>Please provide the file path to your article.</ask>
    <action>Read file and extract content.</action>
    <template-output>source_content</template-output>
  </check>

  <check if="option_C">
    <ask>Please provide the path to your video file or video script.</ask>
    <action>
      If video file: Extract transcript or narration script
      If script file: Read script content
    </action>
    <template-output>source_content</template-output>
  </check>

  <check if="option_D">
    <action>Locate most recent content from specified workflow output.</action>
    <template-output>source_content</template-output>
  </check>
</step>

<step n="2" goal="Analyze content for adaptation">
  <action>Invoke the subject-analyst agent to analyze content for social media adaptation.</action>
  <invoke-agent>bmad/content-creation/agents/subject-analyst.md</invoke-agent>
  <context>
    - Source content: {{source_content}}
    - Goal: Identify key points, hooks, quotable segments, and platform-appropriate angles
  </context>
  <template-output>content_analysis</template-output>
</step>

<step n="3" goal="Select target platforms">
  <ask>Which social media platforms would you like to create content for? (Select all that apply)

[ ] Twitter/X (Thread format)
[ ] LinkedIn (Post + Carousel)
[ ] Instagram (Carousel + Reels script)
[ ] Facebook (Post)
[ ] YouTube Shorts (Script)
[ ] TikTok (Script)

Please list the platforms you want.</ask>
<template-output>target_platforms</template-output>
</step>

<step n="4" goal="Generate Twitter/X thread" conditional="twitter in target_platforms">
  <action>Invoke the screenwriter agent to create Twitter/X thread.</action>
  <invoke-agent>bmad/content-creation/agents/screenwriter.md</invoke-agent>
  <context>
    - Source content: {{source_content}}
    - Content analysis: {{content_analysis}}
    - Platform: Twitter/X
    - Format: Thread (optimal: 5-10 tweets)
    - Requirements:
      * Opening hook in first tweet
      * Each tweet ≤280 characters
      * Clear narrative flow
      * Engaging voice
      * Call-to-action in final tweet
      * Hashtag recommendations (2-3 max)
  </context>
  <template-output>twitter_thread</template-output>
</step>

<step n="5" goal="Generate LinkedIn content" conditional="linkedin in target_platforms">
  <action>Invoke the screenwriter agent to create LinkedIn post and carousel.</action>
  <invoke-agent>bmad/content-creation/agents/screenwriter.md</invoke-agent>
  <context>
    - Source content: {{source_content}}
    - Content analysis: {{content_analysis}}
    - Platform: LinkedIn
    - Formats needed:
      A) Main post (3000 chars max, professional tone)
      B) Carousel deck (5-10 slides, each with headline + key point)
    - Requirements:
      * Professional yet engaging tone
      * Clear value proposition
      * Storytelling elements
      * Industry-relevant insights
      * CTA for engagement
  </context>
  <template-output>linkedin_post, linkedin_carousel</template-output>
</step>

<step n="6" goal="Generate Instagram content" conditional="instagram in target_platforms">
  <action>Invoke the screenwriter agent to create Instagram carousel and Reels script.</action>
  <invoke-agent>bmad/content-creation/agents/screenwriter.md</invoke-agent>
  <context>
    - Source content: {{source_content}}
    - Content analysis: {{content_analysis}}
    - Platform: Instagram
    - Formats needed:
      A) Carousel post (up to 10 slides with captions)
      B) Reels script (30-60 seconds)
    - Requirements:
      * Visual-first approach
      * Short, punchy captions
      * Engaging hook in first 3 seconds (Reels)
      * Hashtag strategy (mix of broad and niche, 10-15 total)
      * Call-to-action
  </context>
  <template-output>instagram_carousel, instagram_reels_script</template-output>
</step>

<step n="7" goal="Generate Facebook post" conditional="facebook in target_platforms">
  <action>Invoke the screenwriter agent to create Facebook post.</action>
  <invoke-agent>bmad/content-creation/agents/screenwriter.md</invoke-agent>
  <context>
    - Source content: {{source_content}}
    - Content analysis: {{content_analysis}}
    - Platform: Facebook
    - Format: Standard post
    - Requirements:
      * Conversational, community-building tone
      * Clear hook
      * Encourage comments and shares
      * Link placement strategy
      * Emoji usage (moderate)
  </context>
  <template-output>facebook_post</template-output>
</step>

<step n="8" goal="Generate YouTube Shorts script" conditional="youtube_shorts in target_platforms">
  <action>Invoke the screenwriter agent to create YouTube Shorts script.</action>
  <invoke-agent>bmad/content-creation/agents/screenwriter.md</invoke-agent>
  <context>
    - Source content: {{source_content}}
    - Content analysis: {{content_analysis}}
    - Platform: YouTube Shorts
    - Format: Vertical video script (15-60 seconds)
    - Requirements:
      * Immediate hook in first 2 seconds
      * Fast pacing
      * On-screen text callouts
      * Clear visual directions
      * Subscribe CTA at end
      * Thumbnail-friendly final frame
  </context>
  <template-output>youtube_shorts_script</template-output>
</step>

<step n="9" goal="Generate TikTok script" conditional="tiktok in target_platforms">
  <action>Invoke the screenwriter agent to create TikTok script.</action>
  <invoke-agent>bmad/content-creation/agents/screenwriter.md</invoke-agent>
  <context>
    - Source content: {{source_content}}
    - Content analysis: {{content_analysis}}
    - Platform: TikTok
    - Format: Vertical video script (15-60 seconds)
    - Requirements:
      * Trend-aware approach
      * Pattern interrupt hook
      * Fast cuts and visual variety
      * On-screen text elements
      * Sound/music recommendations
      * Hashtag strategy (#FYP + niche tags)
  </context>
  <template-output>tiktok_script</template-output>
</step>

<step n="10" goal="Generate visual asset requirements">
  <action>
    For each platform and format, generate visual asset requirements:

    - Image/graphic specifications (dimensions, format, style)
    - Video clip requirements (if applicable)
    - Text overlay suggestions
    - Brand element placement
    - Color scheme recommendations

    Organize by platform and content piece.

  </action>
  <template-output>visual_asset_requirements</template-output>
</step>

<step n="11" goal="Create posting schedule recommendations">
  <action>Invoke the distribution-manager agent to create optimal posting schedule.</action>
  <invoke-agent>bmad/content-creation/agents/distribution-manager.md</invoke-agent>
  <context>
    - Platforms: {{target_platforms}}
    - Content pieces: {{all_generated_content}}
    - Goal: Recommend optimal posting times and sequence for maximum reach
  </context>
  <template-output>posting_schedule</template-output>
</step>

<step n="12" goal="Compile social media content kit">
  <action>
    Create organized social media content kit:

    1. Create directory structure:
       /social-media-kit-{{date}}/
       ├── twitter/ (thread copy)
       ├── linkedin/ (post + carousel slides)
       ├── instagram/ (carousel + reels script)
       ├── facebook/ (post copy)
       ├── youtube-shorts/ (script)
       ├── tiktok/ (script)
       ├── visual-assets/ (requirements and specifications)
       └── posting-schedule.md

    2. Generate master content kit document with all content organized

    3. Save to: {{output_folder}}/social-media-kits/{{topic}}-{{date}}/

  </action>
  <template-output>content_kit_path</template-output>
</step>

<step n="13" goal="Final summary and next steps">
  <action>Present final summary:
  - Content kit location and contents
  - Platform-by-platform overview
  - Visual asset requirements
  - Posting schedule recommendations
  - Link to promote-content workflow for automated posting
  - Performance tracking recommendations
  </action>
  <template-output>final_summary</template-output>
</step>

</workflow>
