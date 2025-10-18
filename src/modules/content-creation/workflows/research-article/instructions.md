# Research Article Workflow Instructions

<workflow>

<critical>The workflow execution engine is governed by: {project-root}/bmad/core/tasks/workflow.xml</critical>
<critical>You MUST have already loaded and processed: {project-root}/src/modules/content-creation/workflows/research-article/workflow.yaml</critical>

<step n="1" goal="Get topic from the user">
  <ask>Please provide the topic for the article you would like to research and write.</ask>
  <template-output>topic</template-output>
</step>

<step n="2" goal="Perform research">
  <action>Invoke the archival-researcher agent to perform research on the topic.</action>
  <invoke-agent>bmad/content-creation/agents/archival-researcher.md</invoke-agent>
  <template-output>research_findings</template-output>
</step>

<step n="3" goal="Analyze the subject">
  <action>Invoke the subject-analyst agent to analyze the subject.</action>
  <invoke-agent>bmad/content-creation/agents/subject-analyst.md</invoke-agent>
  <template-output>subject_analysis</template-output>
</step>

<step n="4" goal="Create an outline">
  <action>Invoke the subject-analyst agent to create an outline for the article.</action>
  <invoke-agent>bmad/content-creation/agents/subject-analyst.md</invoke-agent>
  <template-output>outline</template-output>
</step>

<step n="5" goal="Write the article">
  <action>Invoke the screenwriter agent to write the article based on the outline and research.</action>
  <invoke-agent>bmad/content-creation/agents/screenwriter.md</invoke-agent>
  <template-output>article_draft</template-output>
</step>

<step n="6" goal="Edit the article">
  <action>Invoke the editor agent to edit the article for clarity, consistency, and quality.</action>
  <invoke-agent>bmad/content-creation/agents/editor.md</invoke-agent>
  <template-output>edited_draft</template-output>
</step>

<step n="7" goal="Fact-check the article">
  <action>Invoke the fact-checker agent to verify the factual accuracy of the article.</action>
  <invoke-agent>bmad/content-creation/agents/fact-checker.md</invoke-agent>
  <template-output>fact_check_report</template-output>
</step>

<step n="8" goal="Final review">
  <action>Present the final article for review.</action>
  <template-output>final_article</template-output>
</step>

</workflow>
