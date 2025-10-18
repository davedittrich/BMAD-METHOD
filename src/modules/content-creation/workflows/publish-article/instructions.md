# Publish Article Workflow Instructions

<workflow>

<critical>The workflow execution engine is governed by: {project-root}/bmad/core/tasks/workflow.xml</critical>
<critical>You MUST have already loaded and processed: {project-root}/src/modules/content-creation/workflows/publish-article/workflow.yaml</critical>

<step n="1" goal="Get article content from the user">
  <ask>Please provide the article content you would like to publish.</ask>
  <template-output>article_content</template-output>
</step>

<step n="2" goal="Get the target platform from the user">
  <ask>Which platform are you targeting? (e.g., Medium, Substack, WordPress)</ask>
  <template-output>target_platform</template-output>
</step>

<step n="3" goal="Handle API authentication">
  <action>Handle API authentication for the target platform.</action>
  <template-output>authentication_status</template-output>
</step>

<step n="4" goal="Handle metadata and SEO">
  <action>Handle metadata and SEO for the article.</action>
  <template-output>metadata_and_seo</template-output>
</step>

<step n="5" goal="Publish the article to the target platform">
  <action>Publish the article to the target platform.</action>
  <template-output>publication_status</template-output>
</step>

<step n="6" goal="Output the publication status">
  <action>Output the final publication status.</action>
  <template-output>final_status</template-output>
</step>

</workflow>
