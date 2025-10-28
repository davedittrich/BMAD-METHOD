# Create Video Assets Workflow Instructions

<workflow>

<critical>The workflow execution engine is governed by: {project-root}/bmad/core/tasks/workflow.xml</critical>
<critical>You MUST have already loaded and processed: {project-root}/src/modules/content-creation/workflows/create-video-assets/workflow.yaml</critical>

<step n="1" goal="Get source content">
  <ask>Please provide the article or script content you would like to transform into video assets. You can paste the content directly, or provide a file path.</ask>
  <template-output>source_content</template-output>
</step>

<step n="2" goal="Determine output preference">
  <ask>What would you like to create?
  A) Production Kit - Complete storyboard, audio, and visual assets for manual video production
  B) AI-Generated Video - Fully automated video generation (experimental)</ask>
  <template-output>output_preference</template-output>
</step>

<step n="3" goal="Analyze content for video structure">
  <action>Invoke the director agent to analyze the content and determine optimal video structure (scenes, pacing, visual approach).</action>
  <invoke-agent>bmad/content-creation/agents/director.md</invoke-agent>
  <context>
    - Source content: {{source_content}}
    - Goal: Break content into scenes with timing and visual style recommendations
  </context>
  <template-output>video_structure</template-output>
</step>

<step n="4" goal="Create detailed storyboard">
  <action>Invoke the director agent to create a detailed storyboard with scene-by-scene visual descriptions, camera angles, and transitions.</action>
  <invoke-agent>bmad/content-creation/agents/director.md</invoke-agent>
  <context>
    - Video structure: {{video_structure}}
    - Goal: Detailed storyboard with visual descriptions for each scene
  </context>
  <template-output>storyboard</template-output>
</step>

<step n="5" goal="Generate narration script">
  <action>Invoke the screenwriter agent to adapt the source content into optimized narration script with timing markers.</action>
  <invoke-agent>bmad/content-creation/agents/screenwriter.md</invoke-agent>
  <context>
    - Source content: {{source_content}}
    - Storyboard: {{storyboard}}
    - Goal: Narration script synchronized with storyboard scenes
  </context>
  <template-output>narration_script</template-output>
</step>

<step n="6" goal="Generate audio narration">
  <ask>How would you like to create the audio narration?
  A) Use text-to-speech (TTS) - Automatic generation
  B) Provide your own audio file
  C) Skip audio generation for now</ask>
  <check if="option_A">
    <action>
      Generate audio using TTS API. If TTS API is unavailable, provide the narration script for external TTS processing.
      Note: TTS generation requires external API integration (e.g., ElevenLabs, Google Cloud TTS, Amazon Polly).
    </action>
    <template-output>audio_file_path or tts_instructions</template-output>
  </check>
  <check if="option_B">
    <ask>Please provide the path to your audio file.</ask>
    <template-output>audio_file_path</template-output>
  </check>
  <check if="option_C">
    <action>Skip audio generation. Narration script will be included in production kit.</action>
    <template-output>audio_status: skipped</template-output>
  </check>
</step>

<step n="7" goal="Provision visual assets">
  <ask>How would you like to create visual assets for each scene?
  A) AI-generated images (requires API access)
  B) Provide your own images/video clips
  C) Use stock footage/images (requires stock API access)
  D) Manual provisioning - Generate asset list only</ask>

  <check if="option_A">
    <action>
      Generate AI images for each storyboard scene using image generation API (e.g., DALL-E, Midjourney, Stable Diffusion).
      For each scene in storyboard:
      - Extract visual description
      - Generate image prompt
      - Call image generation API
      - Save image with scene reference

      If API is unavailable: Generate detailed image prompts for manual creation.
    </action>
    <template-output>visual_assets_paths or image_prompts</template-output>

  </check>

  <check if="option_B">
    <ask>Please provide the directory path containing your visual assets. Assets should be named or organized to match storyboard scenes.</ask>
    <action>
      - Scan provided directory
      - Map assets to storyboard scenes
      - Verify all scenes have corresponding visual assets
      - Report any missing assets
    </action>
    <template-output>visual_assets_mapping</template-output>
  </check>

  <check if="option_C">
    <action>
      Search stock footage/image providers for each scene.
      Note: Requires stock API integration (e.g., Pexels, Unsplash, Shutterstock).

      If API is unavailable: Generate search queries for manual stock sourcing.
    </action>
    <template-output>stock_assets or stock_search_queries</template-output>

  </check>

  <check if="option_D">
    <action>
      Generate detailed asset provisioning list:
      - Scene-by-scene visual requirements
      - Recommended asset types (photo, video clip, animation, text overlay)
      - Technical specifications (resolution, format, duration)
      - Visual style guidelines
    </action>
    <template-output>asset_provisioning_list</template-output>
  </check>
</step>

<step n="8" goal="Create assembly instructions">
  <action>Generate detailed video assembly instructions including:
  - Scene sequence and timing
  - Visual asset placement
  - Audio synchronization points
  - Transition effects
  - Text overlays and captions
  - Recommended video editing software and export settings
  </action>
  <template-output>assembly_instructions</template-output>
</step>

<step n="9" goal="Generate production kit or AI video">
  <check if="output_preference == production_kit">
    <action>
      Compile production kit with all assets:
      1. Create organized directory structure:
         - /storyboard/ - Visual storyboard document
         - /audio/ - Narration audio files or TTS instructions
         - /visuals/ - All visual assets organized by scene
         - /scripts/ - Narration script with timing markers
         - /instructions/ - Assembly instructions and technical specifications

      2. Generate production kit manifest document listing all files and their purposes

      3. Save production kit to: {{output_folder}}/video-production-kits/{{topic}}-{{date}}/
    </action>
    <template-output>production_kit_path</template-output>

  </check>

  <check if="output_preference == ai_video">
    <action>
      Attempt AI video generation (experimental):
      Note: This requires advanced video generation API (e.g., Runway, Synthesia, D-ID).

      1. Compile all assets (storyboard, audio, visuals)
      2. Generate video assembly configuration for AI video tool
      3. Call video generation API
      4. Monitor generation progress
      5. Download and save generated video

      If API unavailable or generation fails:
      - Fall back to production kit creation
      - Provide video generation configuration for manual processing
    </action>
    <template-output>video_file_path or fallback_production_kit_path</template-output>

  </check>
</step>

<step n="10" goal="Final summary and next steps">
  <action>Present final output summary:
  - Production kit location and contents
  - Asset inventory
  - Next steps for video production
  - Recommendations for video editing tools
  - Link to publish-video workflow for distribution
  </action>
  <template-output>final_summary</template-output>
</step>

</workflow>
