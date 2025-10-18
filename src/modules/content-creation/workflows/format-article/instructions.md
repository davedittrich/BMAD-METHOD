# Format Article Workflow Instructions

<workflow>

<critical>The workflow execution engine is governed by: {project-root}/bmad/core/tasks/workflow.xml</critical>
<critical>You MUST have already loaded and processed: {project-root}/src/modules/content-creation/workflows/format-article/workflow.yaml</critical>

<step n="1" goal="Get article content from the user">
  <ask>Please provide the article content you would like to format.</ask>
  <template-output>article_content</template-output>
</step>

<step n="2" goal="Get the target platform from the user">
  <ask>Which platform are you targeting? (e.g., Medium, Substack, WordPress)</ask>
  <template-output>target_platform</template-output>
</step>

<step n="3" goal="Apply platform-specific formatting">
  <action>Apply formatting specific to the target platform.</action>
  <template-output>formatted_content</template-output>
</step>

<step n="4" goal="Handle image sourcing and integration">
  <action>Handle image sourcing and integration.</action>
  <template-output>content_with_images</template-output>
</step>

<step n="5" goal="Handle link previews">
  <action>Handle link previews.</action>
  <template-output>content_with_link_previews</template-output>
</step>

<step n="6" goal="Output the formatted article">
  <action>Output the final formatted article.</action>
  <template-output>final_article</template-output>
</step>

</workflow>
