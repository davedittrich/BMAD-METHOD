# Promote Content Workflow Instructions

<workflow>

<critical>The workflow execution engine is governed by: {project-root}/bmad/core/tasks/workflow.xml</critical>
<critical>You MUST have already loaded and processed: {project-root}/src/modules/content-creation/workflows/promote-content/workflow.yaml</critical>

<step n="1" goal="Get content to promote">
  <ask>What content would you like to promote?

A) Article (provide URL or file path)
B) Video (provide platform URL: YouTube, Vimeo, etc.)
C) Podcast episode (provide URL or platform link)
D) Social media content kit (from adapt-for-social-media workflow)
E) Other content (describe and provide link)</ask>

<template-output>content_type, content_url, content_details</template-output>
</step>

<step n="2" goal="Fetch and analyze content">
  <action>
    Fetch content for analysis:

    If article: Extract title, summary, key points
    If video: Extract title, description, key segments
    If podcast: Extract title, description, topics discussed
    If social media kit: Review existing content pieces
    If other: Extract available metadata

  </action>

<action>Invoke the subject-analyst agent to analyze content for promotional angles.</action>
<invoke-agent>bmad/content-creation/agents/subject-analyst.md</invoke-agent>
<context> - Content: {{content_details}} - Goal: Identify promotional hooks, audience benefits, curiosity gaps, compelling angles
</context>
<template-output>content_analysis</template-output>
</step>

<step n="3" goal="Define promotional objectives">
  <ask>What are your promotional objectives? (Select all that apply)

[ ] Maximize reach and impressions
[ ] Drive traffic/clicks to content
[ ] Increase engagement (likes, comments, shares)
[ ] Build authority and credibility
[ ] Grow followers/subscribers
[ ] Generate leads or conversions
[ ] Other (specify)</ask>

<template-output>promotional_objectives</template-output>
</step>

<step n="4" goal="Select target platforms for promotion">
  <ask>Which platforms would you like to promote on? (Select all that apply)

[ ] Twitter/X
[ ] LinkedIn
[ ] Instagram
[ ] Facebook
[ ] Reddit (specify subreddits)
[ ] Email newsletter
[ ] Other (specify)</ask>

<template-output>promotion_platforms</template-output>
</step>

<step n="5" goal="Define campaign duration and frequency">
  <ask>How would you like to structure your promotional campaign?

A) Single-burst - All posts published at once or within 24 hours
B) Short campaign - Posts spread over 3-7 days
C) Extended campaign - Posts spread over 1-4 weeks
D) Ongoing promotion - Evergreen posts for long-term promotion
E) Custom schedule (you specify)</ask>

<template-output>campaign_duration, campaign_structure</template-output>

<ask>How many promotional posts would you like per platform?
(Recommendation: 3-5 posts per platform with different angles)</ask>

<template-output>posts_per_platform</template-output>
</step>

<step n="6" goal="Generate promotional posts">
  <action>Invoke the audience-engagement-manager agent to generate promotional posts for each platform.</action>
  <invoke-agent>bmad/content-creation/agents/audience-engagement-manager.md</invoke-agent>
  <context>
    - Content analysis: {{content_analysis}}
    - Promotional objectives: {{promotional_objectives}}
    - Target platforms: {{promotion_platforms}}
    - Posts per platform: {{posts_per_platform}}
    - Campaign structure: {{campaign_structure}}

    Generate platform-specific promotional posts with:
    - Multiple angles and hooks
    - Variety in approach (question, stat, quote, story, benefit, etc.)
    - Platform-optimized formatting
    - Strategic hashtags
    - Clear calls-to-action
    - Link placement

  </context>
  <template-output>promotional_posts</template-output>
</step>

<step n="7" goal="Create variation for testing">
  <ask>Would you like to create A/B test variations for key posts?
  A) Yes - Create 2-3 variations for high-priority posts
  B) No - Use single version per post</ask>

  <check if="option_A">
    <action>Invoke the audience-engagement-manager agent to create variations.</action>
    <invoke-agent>bmad/content-creation/agents/audience-engagement-manager.md</invoke-agent>
    <context>
      - Original posts: {{promotional_posts}}
      - Goal: Create 2-3 variations with different hooks, formats, or CTAs
    </context>
    <template-output>post_variations</template-output>
  </check>
</step>

<step n="8" goal="Generate visual recommendations">
  <action>
    Generate visual asset recommendations for promotional posts:

    For each platform and post:
    - Recommended image type (quote graphic, thumbnail, teaser image, infographic)
    - Image dimensions and format
    - Design suggestions (colors, fonts, elements)
    - Text overlay recommendations
    - Link preview optimization

    Organize by platform and post.

  </action>
  <template-output>visual_recommendations</template-output>
</step>

<step n="9" goal="Create posting schedule">
  <action>Invoke the distribution-manager agent to create optimal posting schedule.</action>
  <invoke-agent>bmad/content-creation/agents/distribution-manager.md</invoke-agent>
  <context>
    - Platforms: {{promotion_platforms}}
    - Campaign duration: {{campaign_duration}}
    - Campaign structure: {{campaign_structure}}
    - Number of posts: {{total_post_count}}
    - Goal: Create schedule that maximizes reach and avoids over-posting
  </context>
  <template-output>posting_schedule</template-output>
</step>

<step n="10" goal="Generate scheduling integration options">
  <ask>How would you like to handle post scheduling?

A) Manual posting - I'll post manually using the schedule
B) Export for scheduling tool (Buffer, Hootsuite, Later, etc.)
C) API integration - Direct scheduling via platform APIs
D) Generate scheduling instructions only</ask>

  <check if="option_B">
    <ask>Which scheduling tool do you use?
    A) Buffer
    B) Hootsuite
    C) Later
    D) Sprout Social
    E) Other (specify)</ask>

    <action>
      Generate CSV or format compatible with selected scheduling tool:
      - Date/time
      - Platform
      - Post text
      - Media URLs
      - Link
      - Notes
    </action>
    <template-output>scheduling_export_file</template-output>

  </check>

  <check if="option_C">
    <action>
      Note: API scheduling requires authentication and integration setup for each platform.
      This feature requires additional configuration and is experimental.

      Generate API scheduling configuration with post data ready for API calls.
    </action>
    <template-output>api_scheduling_config</template-output>

  </check>

  <check if="option_A or option_D">
    <action>Generate manual posting instructions with schedule.</action>
    <template-output>manual_posting_instructions</template-output>
  </check>
</step>

<step n="11" goal="Create engagement strategy">
  <action>Invoke the audience-engagement-manager agent to create engagement strategy.</action>
  <invoke-agent>bmad/content-creation/agents/audience-engagement-manager.md</invoke-agent>
  <context>
    - Promotional posts: {{promotional_posts}}
    - Platforms: {{promotion_platforms}}
    - Goal: Create strategy for responding to comments, engaging with audience, amplifying reach
  </context>
  <template-output>engagement_strategy</template-output>
</step>

<step n="12" goal="Set up tracking and analytics">
  <action>
    Generate tracking and analytics recommendations:

    1. UTM parameters for links (campaign tracking)
       - utm_source (platform)
       - utm_medium (social)
       - utm_campaign (campaign name)
       - utm_content (post variant)

    2. Key metrics to track per platform:
       - Impressions/Reach
       - Clicks/CTR
       - Engagements
       - Conversions

    3. Recommended tools:
       - Google Analytics for traffic
       - Bitly or similar for link tracking
       - Native platform analytics
       - Social media management tool analytics

    4. Success criteria based on objectives

  </action>
  <template-output>tracking_analytics_plan</template-output>
</step>

<step n="13" goal="Compile promotional campaign kit">
  <action>
    Create organized promotional campaign kit:

    1. Create directory structure:
       /promotional-campaign-{{date}}/
       ├── posts/
       │   ├── twitter/
       │   ├── linkedin/
       │   ├── instagram/
       │   ├── facebook/
       │   └── other/
       ├── variations/ (if A/B testing)
       ├── visuals/
       │   └── recommendations.md
       ├── schedule/
       │   ├── posting-schedule.md
       │   └── scheduling-export.csv (if applicable)
       ├── tracking/
       │   └── analytics-plan.md
       └── engagement-strategy.md

    2. Generate master campaign document with all content organized

    3. Save to: {{output_folder}}/promotional-campaigns/{{content_title}}-{{date}}/

  </action>
  <template-output>campaign_kit_path</template-output>
</step>

<step n="14" goal="Final summary and execution plan">
  <action>Present final campaign summary:
  - Campaign kit location and contents
  - Content being promoted
  - Promotional objectives
  - Platform breakdown (posts per platform)
  - Campaign duration and structure
  - Posting schedule overview
  - Next steps for execution
  - Tracking and success criteria
  - Engagement strategy highlights
  </action>
  <template-output>final_summary</template-output>
</step>

</workflow>
