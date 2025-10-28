# Publish Video Workflow Instructions

<workflow>

<critical>The workflow execution engine is governed by: {project-root}/bmad/core/tasks/workflow.xml</critical>
<critical>You MUST have already loaded and processed: {project-root}/src/modules/content-creation/workflows/publish-video/workflow.yaml</critical>

<step n="1" goal="Get video file">
  <ask>Please provide the video file you would like to publish. You can:
  A) Provide a file path to your video
  B) Use the most recent video from create-video-assets workflow</ask>
  <check if="option_A">
    <ask>Please provide the full path to your video file.</ask>
    <action>Verify file exists and is a valid video format (mp4, mov, avi, webm, etc.)</action>
    <template-output>video_file_path</template-output>
  </check>
  <check if="option_B">
    <action>Locate most recent video production kit or AI-generated video from create-video-assets workflow output.</action>
    <template-output>video_file_path</template-output>
  </check>
</step>

<step n="2" goal="Select target platform">
  <ask>Which platform would you like to publish to?
  A) YouTube
  B) TikTok
  C) Vimeo
  D) Facebook/Instagram Reels
  E) Multiple platforms (requires multiple uploads)</ask>
  <template-output>target_platform</template-output>
</step>

<step n="3" goal="Generate or collect metadata">
  <action>Invoke the distribution-manager agent to generate optimized metadata for the selected platform.</action>
  <invoke-agent>bmad/content-creation/agents/distribution-manager.md</invoke-agent>
  <context>
    - Video file: {{video_file_path}}
    - Target platform: {{target_platform}}
    - Goal: Generate platform-optimized title, description, tags, category
  </context>
  <template-output>video_metadata</template-output>

<ask>Please review the generated metadata:

Title: {{video_metadata.title}}
Description: {{video_metadata.description}}
Tags: {{video_metadata.tags}}
Category: {{video_metadata.category}}

Would you like to:
A) Use this metadata as-is
B) Edit the metadata
C) Provide completely custom metadata</ask>

  <check if="option_B or option_C">
    <ask>Please provide your metadata:
    - Title:
    - Description:
    - Tags (comma-separated):
    - Category:</ask>
    <template-output>final_metadata</template-output>
  </check>
  <check if="option_A">
    <action>Use generated metadata as final metadata.</action>
    <template-output>final_metadata = video_metadata</template-output>
  </check>
</step>

<step n="4" goal="Handle thumbnail">
  <ask>How would you like to handle the video thumbnail?
  A) Auto-generate thumbnail from video frame
  B) AI-generate custom thumbnail
  C) Provide your own thumbnail image
  D) Use platform default (no custom thumbnail)</ask>

  <check if="option_A">
    <ask>Which frame would you like to use?
    A) Beginning (0-5 seconds)
    B) Middle
    C) End
    D) Specific timestamp (you provide)</ask>
    <action>Extract frame from video at specified position and save as thumbnail image.</action>
    <template-output>thumbnail_path</template-output>
  </check>

  <check if="option_B">
    <action>
      Generate AI thumbnail using image generation API.
      - Analyze video content and metadata
      - Create engaging thumbnail prompt
      - Generate thumbnail image (1280x720 for YouTube, platform-appropriate for others)
      - Add text overlay if appropriate

      If API unavailable: Generate thumbnail design specifications for manual creation.
    </action>
    <template-output>thumbnail_path or thumbnail_specifications</template-output>

  </check>

  <check if="option_C">
    <ask>Please provide the path to your thumbnail image.
    Note: YouTube recommends 1280x720 pixels, TikTok 1080x1920 pixels.</ask>
    <action>Verify image exists and meets platform requirements.</action>
    <template-output>thumbnail_path</template-output>
  </check>

  <check if="option_D">
    <action>Skip custom thumbnail. Platform will auto-generate.</action>
    <template-output>thumbnail_status: platform_default</template-output>
  </check>
</step>

<step n="5" goal="Configure platform-specific settings">
  <check if="target_platform == YouTube">
    <ask>YouTube-specific settings:

    Privacy:
    A) Public
    B) Unlisted
    C) Private
    D) Scheduled (public at specific time)

    Monetization:
    A) Enable monetization (if eligible)
    B) Disable monetization

    Age Restriction:
    A) Not age-restricted
    B) Age-restricted (18+)

    Comments:
    A) Allow all comments
    B) Hold potentially inappropriate comments for review
    C) Disable comments

    Please select your preferences for each setting.</ask>
    <template-output>youtube_settings</template-output>

  </check>

  <check if="target_platform == TikTok">
    <ask>TikTok-specific settings:

    Privacy:
    A) Public
    B) Friends only
    C) Private

    Comments:
    A) Enable comments
    B) Disable comments

    Duet/Stitch:
    A) Allow Duet and Stitch
    B) Disable Duet and Stitch

    Please select your preferences for each setting.</ask>
    <template-output>tiktok_settings</template-output>

  </check>

  <check if="target_platform == Vimeo">
    <ask>Vimeo-specific settings:

    Privacy:
    A) Anyone (Public)
    B) Only people with the private link
    C) Only me
    D) Hide from Vimeo.com

    Download:
    A) Allow downloads
    B) Disable downloads

    Please select your preferences for each setting.</ask>
    <template-output>vimeo_settings</template-output>

  </check>
</step>

<step n="6" goal="Authenticate with platform API">
  <action>
    Check for existing API credentials/tokens for {{target_platform}}.

    If credentials exist and are valid:
    - Use existing authentication

    If credentials missing or expired:
    - Guide user through OAuth authentication flow
    - Store tokens securely

    Platform-specific authentication:
    - YouTube: Google OAuth 2.0
    - TikTok: TikTok OAuth 2.0
    - Vimeo: Vimeo OAuth 2.0

  </action>

  <check if="credentials_missing">
    <ask>API credentials for {{target_platform}} are not configured.

    To publish to {{target_platform}}, you'll need to:
    1. Create an API application on {{target_platform}}
    2. Obtain OAuth credentials (Client ID and Client Secret)
    3. Complete the OAuth authorization flow

    Would you like to:
    A) Set up API authentication now (I'll guide you through)
    B) Manual upload - I'll provide instructions for manual video upload
    C) Skip authentication for now</ask>

    <check if="option_A">
      <action>Guide user through API setup:
      1. Provide platform-specific API setup instructions
      2. Request Client ID and Client Secret
      3. Generate OAuth authorization URL
      4. Handle OAuth callback
      5. Store tokens securely
      </action>
      <template-output>authentication_status: authenticated</template-output>
    </check>

    <check if="option_B">
      <action>Generate manual upload instructions with all metadata and settings documented.</action>
      <template-output>manual_upload_instructions</template-output>
      <stop>Workflow stops here - manual upload required.</stop>
    </check>

    <check if="option_C">
      <stop>Workflow stopped by user - authentication skipped.</stop>
    </check>

  </check>
</step>

<step n="7" goal="Upload video">
  <action>
    Begin video upload to {{target_platform}}:

    1. Verify video file meets platform requirements:
       - YouTube: Max 256GB, up to 12 hours duration
       - TikTok: Max 4GB, up to 10 minutes (may vary by account)
       - Vimeo: Varies by plan (Basic: 500MB/week, Plus: 5GB/week, Pro: 20GB/week)

    2. Prepare upload request with metadata and settings

    3. Upload video using platform API with progress monitoring

    4. Handle upload errors gracefully with retry logic

    5. Confirm successful upload

  </action>

<template-output>upload_status</template-output>

  <check if="upload_failed">
    <action>
      Report upload failure with error details.
      Provide troubleshooting steps and retry option.
    </action>
    <ask>Upload failed. Would you like to:
    A) Retry upload
    B) Generate manual upload instructions
    C) Cancel</ask>
  </check>
</step>

<step n="8" goal="Upload thumbnail if provided">
  <check if="thumbnail_path exists">
    <action>
      Upload custom thumbnail to {{target_platform}}:
      - Verify thumbnail meets platform size/format requirements
      - Upload thumbnail using platform API
      - Confirm thumbnail set successfully
    </action>
    <template-output>thumbnail_upload_status</template-output>
  </check>
</step>

<step n="9" goal="Finalize and publish">
  <action>
    Complete publication process:

    1. Apply all platform-specific settings (privacy, monetization, etc.)

    2. If scheduled publication: Set publication time

    3. Finalize video status (make live, schedule, keep private)

    4. Retrieve video URL and platform-specific metadata

    5. Generate publication report

  </action>

<template-output>publication_report</template-output>
</step>

<step n="10" goal="Post-publication tasks">
  <action>Invoke the audience-engagement-manager agent to provide post-publication recommendations.</action>
  <invoke-agent>bmad/content-creation/agents/audience-engagement-manager.md</invoke-agent>
  <context>
    - Video URL: {{video_url}}
    - Platform: {{target_platform}}
    - Goal: Provide engagement and promotion recommendations
  </context>
  <template-output>engagement_recommendations</template-output>
</step>

<step n="11" goal="Final summary and next steps">
  <action>Present final publication summary:
  - Video URL and platform
  - Metadata used
  - Publication settings
  - Engagement recommendations
  - Link to promote-content workflow for multi-platform promotion
  - Analytics tracking instructions
  </action>
  <template-output>final_summary</template-output>
</step>

</workflow>
