# Analyze and Respond Workflow Instructions

<workflow>

<critical>The workflow execution engine is governed by: {project-root}/bmad/core/tasks/workflow.xml</critical>
<critical>You MUST have already loaded and processed: {project-root}/src/modules/content-creation/workflows/analyze-and-respond/workflow.yaml</critical>

<step n="1" goal="Get topic or sources from the user">
  <ask>Please provide the topic you would like to analyze, or a list of sources to review.</ask>
  <template-output>initial_input</template-output>
</step>

<step n="2" goal="Perform integrity analysis">
  <action>Invoke the integrity-analyst agent to analyze the input.</action>
  <invoke-agent>bmad/content-creation/agents/integrity-analyst.md</invoke-agent>
  <template-output>integrity_analysis</template-output>
</step>

<step n="3" goal="Perform fallacy analysis">
  <action>Invoke the fallacy-detective agent to analyze the input.</action>
  <invoke-agent>bmad/content-creation/agents/fallacy-detective.md</invoke-agent>
  <template-output>fallacy_analysis</template-output>
</step>

<step n="4" goal="Allow user to add more sources and iterate">
  <ask>Would you like to add more sources or refine the analysis? [y/n]</ask>
  <if condition="user_response == 'y'">
    <goto step="1" />
  </if>
</step>

<step n="5" goal="Generate a report">
  <action>Generate a report summarizing the analysis.</action>
  <template-output>final_report</template-output>
</step>

</workflow>
