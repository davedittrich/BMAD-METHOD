# Validate Module - Comprehensive Module Validation Instructions

<critical>The workflow execution engine is governed by: {project-root}/.bmad/core/tasks/workflow.xml</critical>
<critical>You MUST have already loaded and processed: {project-root}/src/modules/content-creation/workflows/validate-module/workflow.yaml</critical>
<critical>Communicate all responses in {communication_language}</critical>

<workflow>

<step n="0" goal="Initialize validation session">
  <action>Display validation overview</action>

  <output>
# {target_module_name} Module Validation

**Validation Mode:** {validation_mode}
**Components to Validate:**

- Agents: {expected_agents}
- Workflows: {expected_workflows}
- Tasks: {expected_tasks}
- Total: {expected_total_components}

**Thresholds:**

- Minimum Pass: {minimum_pass_percentage}%
- Critical Issues: {critical_issues_threshold}
- Warnings: {warning_threshold}
  </output>

  <ask>Select validation mode:

1. **Comprehensive** - All components + integration testing (recommended)
2. **Quick** - Configuration validation only (fast)
3. **Components Only** - Agents, workflows, tasks (no integration)
4. **Integration Only** - Pipeline testing only

Your choice [1/2/3/4]:
</ask>

<action>Set validation_mode based on user selection</action>
<action>Create output directory: {detailed_reports_folder}</action>

<template-output>validation_mode_selection</template-output>
</step>

<step n="1" goal="Agent Validation Loop" if="validation_mode != integration-only">
  <action>Display step header</action>

  <output>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
## Step 1: Agent Validation ({expected_agents} agents)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  </output>

<action>Load all agent files from {target_module_path}/agents/\*.yaml</action>
<action>Initialize agent_validation_results = []</action>
<action>Initialize agent_pass_count = 0</action>
<action>Initialize agent_fail_count = 0</action>

<action>For each agent file in agents/ directory:</action>

  <substep n="1a" title="Agent Configuration Validation">
    <action>Parse YAML file</action>
    <action>Extract agent_name from filename</action>

    <output>Validating: {agent_name}</output>

    <action>Check metadata section:</action>
    - [ ] id field exists and follows pattern: bmad/{module}/agents/{name}.md
    - [ ] name field exists
    - [ ] title field exists
    - [ ] icon field exists (emoji)
    - [ ] module field matches {target_module_name}

    <action>Check persona section:</action>
    - [ ] role field exists and is non-empty
    - [ ] identity field exists and is non-empty
    - [ ] communication_style field exists
    - [ ] principles field exists with at least 3 principles

    <action>Check menu section:</action>
    - [ ] menu field exists
    - [ ] At least 1 menu command defined
    - [ ] Each menu item has: trigger, workflow/task, description

    <action>Check knowledge references (if present):</action>
    - [ ] For each knowledge file referenced, verify file exists
    - [ ] Path format: bmad/{module}/... or {project-root}/...

    <action>Calculate agent_config_score (0-100)</action>
    <action>Determine status: PASS (>=80), WARN (60-79), FAIL (<60)</action>

  </substep>

  <substep n="1b" title="Agent Knowledge Integration Check">
    <check if="agent has knowledge references">
      <action>For each knowledge file:</action>
      - Read file to verify it exists and is readable
      - Check file format (markdown, yaml, csv)
      - Verify content is not empty

      <action>Record knowledge_files_valid (true/false)</action>
    </check>

  </substep>

  <substep n="1c" title="Agent Menu Command Validation">
    <action>For each menu command:</action>
    - Extract trigger, workflow/task reference, description
    - Verify workflow/task reference exists
    - Check description is meaningful (>10 chars)

    <action>Record menu_commands_valid (true/false)</action>

  </substep>

  <substep n="1d" title="Record Agent Results">
    <action>Add to agent_validation_results:</action>
    ```json
    {
      "agent": "{agent_name}",
      "config_score": {score},
      "status": "{status}",
      "metadata_valid": {true/false},
      "persona_complete": {true/false},
      "menu_valid": {true/false},
      "knowledge_valid": {true/false},
      "issues": [list of issues],
      "warnings": [list of warnings]
    }
    ```

    <action if="status == PASS">Increment agent_pass_count</action>
    <action if="status == FAIL">Increment agent_fail_count</action>

    <output>  {agent_name}: {status} ({config_score}%)</output>

  </substep>

<action>After all agents validated, display summary:</action>

  <output>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Agent Validation Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Passed: {agent_pass_count}/{expected_agents}
❌ Failed: {agent_fail_count}/{expected_agents}
📊 Pass Rate: {(agent_pass_count/expected_agents)\*100}%
</output>

<template-output>agent_validation_results</template-output>
</step>

<step n="2" goal="Workflow Validation Loop" if="validation_mode != integration-only">
  <action>Display step header</action>

  <output>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
## Step 2: Workflow Validation ({expected_workflows} workflows)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  </output>

<action>Load all workflow directories from {target_module_path}/workflows/</action>
<action>Exclude: validate-module (this workflow)</action>
<action>Initialize workflow_validation_results = []</action>
<action>Initialize workflow_pass_count = 0</action>
<action>Initialize workflow_fail_count = 0</action>

<action>For each workflow directory:</action>

  <substep n="2a" title="Workflow Configuration Validation">
    <action>Extract workflow_name from directory name</action>

    <output>Validating: {workflow_name}</output>

    <action>Check required files:</action>
    - [ ] workflow.yaml exists
    - [ ] instructions.md exists (or instructions embedded in yaml)
    - [ ] template.md exists (if document workflow)
    - [ ] checklist.md exists (if validation defined)

    <action>Parse workflow.yaml and check:</action>
    - [ ] name field exists
    - [ ] description field exists
    - [ ] config_source field exists and points to module config
    - [ ] output_folder defined (references config_source)
    - [ ] user_name defined (references config_source)
    - [ ] communication_language defined (references config_source)
    - [ ] date field set to system-generated
    - [ ] installed_path defined
    - [ ] instructions reference defined

    <action>Check for variable bloat:</action>
    - Extract all custom variables (non-standard)
    - Cross-reference with instructions.md usage
    - Identify unused variables

    <action>Calculate workflow_config_score (0-100)</action>
    <action>Determine status: PASS (>=80), WARN (60-79), FAIL (<60)</action>

  </substep>

  <substep n="2b" title="Workflow Instructions Validation">
    <check if="instructions.md exists">
      <action>Read instructions.md</action>
      <action>Check for workflow structure tags:</action>
      - [ ] &lt;workflow&gt; tag present
      - [ ] &lt;step&gt; tags with n= attribute
      - [ ] &lt;action&gt; tags within steps
      - [ ] &lt;template-output&gt; tags (if document workflow)

      <action>Validate step numbering:</action>
      - Steps numbered sequentially (1, 2, 3...)
      - No gaps or duplicates

      <action>Check variable usage:</action>
      - All {variable} references in instructions match yaml definitions
      - All {{variable}} references in template match yaml definitions

      <action>Record instructions_valid (true/false)</action>
    </check>

  </substep>

  <substep n="2c" title="Agent Dependency Check">
    <action>Scan instructions.md for agent invocations</action>
    <action>Pattern: invoke-agent or agent references</action>
    <action>For each referenced agent:</action>
    - Verify agent exists in module
    - Check agent is in previously validated agents list

    <action>Record agent_dependencies_valid (true/false)</action>

  </substep>

  <substep n="2d" title="Record Workflow Results">
    <action>Add to workflow_validation_results:</action>
    ```json
    {
      "workflow": "{workflow_name}",
      "config_score": {score},
      "status": "{status}",
      "files_complete": {true/false},
      "config_valid": {true/false},
      "instructions_valid": {true/false},
      "variables_aligned": {true/false},
      "bloat_detected": {count},
      "agent_deps_valid": {true/false},
      "issues": [list],
      "warnings": [list]
    }
    ```

    <action if="status == PASS">Increment workflow_pass_count</action>
    <action if="status == FAIL">Increment workflow_fail_count</action>

    <output>  {workflow_name}: {status} ({config_score}%)</output>

  </substep>

<action>After all workflows validated, display summary:</action>

  <output>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Workflow Validation Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Passed: {workflow_pass_count}/{expected_workflows}
❌ Failed: {workflow_fail_count}/{expected_workflows}
📊 Pass Rate: {(workflow_pass_count/expected_workflows)\*100}%
</output>

<template-output>workflow_validation_results</template-output>
</step>

<step n="3" goal="Task Validation Loop" if="validation_mode != integration-only">
  <action>Display step header</action>

  <output>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
## Step 3: Task Validation ({expected_tasks} tasks)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  </output>

<action>Load all task files from {target_module_path}/tasks/\*.md</action>
<action>Initialize task_validation_results = []</action>
<action>Initialize task_pass_count = 0</action>
<action>Initialize task_fail_count = 0</action>
<action>Initialize framework_tasks_found = []</action>

<action>For each task file:</action>

  <substep n="3a" title="Task Structure Validation">
    <action>Extract task_name from filename</action>

    <output>Validating: {task_name}</output>

    <action>Read task file and check structure:</action>
    - [ ] Has markdown title (# heading)
    - [ ] Has purpose/description section
    - [ ] Has input specification section
    - [ ] Has output specification section
    - [ ] Has clear instructions

    <action>Check for framework references:</action>
    - [ ] If integrity task: mentions Carter framework
    - [ ] If fallacy task: mentions Damer framework
    - [ ] If style task: mentions style analysis
    - [ ] If fact-check task: mentions verification methodology

    <action>Calculate task_structure_score (0-100)</action>
    <action>Determine status: PASS (>=80), WARN (60-79), FAIL (<60)</action>

  </substep>

  <substep n="3b" title="Framework Integration Check">
    <check if="task_name in {carter_framework_tasks}">
      <action>Verify Carter Integrity Framework integration:</action>
      - [ ] Mentions 3-step model (Discernment, Acting, Transparency)
      - [ ] References Stephen L. Carter
      - [ ] Clear integrity criteria

      <action>Add to framework_tasks_found: "Carter - {task_name}"</action>
    </check>

    <check if="task_name in {damer_framework_tasks}">
      <action>Verify Damer Argument Framework integration:</action>
      - [ ] Mentions Five Criteria (Structural, Relevance, Acceptability, Sufficiency, Rebuttal)
      - [ ] References T. Edward Damer
      - [ ] Clear fallacy identification approach

      <action>Add to framework_tasks_found: "Damer - {task_name}"</action>
    </check>

    <action>Record framework_integration_valid (true/false)</action>

  </substep>

  <substep n="3c" title="Task Category Validation">
    <action>Categorize task by function:</action>
    - Integrity Analysis (Carter)
    - Argument Analysis (Damer)
    - Style & Voice
    - Fact-Checking
    - Research
    - Subject Analysis
    - Content Distillation
    - Project Management
    - Writing
    - QA Checklists

    <action>Verify task aligns with module purpose</action>
    <action>Record category and alignment</action>

  </substep>

  <substep n="3d" title="Record Task Results">
    <action>Add to task_validation_results:</action>
    ```json
    {
      "task": "{task_name}",
      "structure_score": {score},
      "status": "{status}",
      "structure_complete": {true/false},
      "framework_integrated": {true/false},
      "category": "{category}",
      "issues": [list],
      "warnings": [list]
    }
    ```

    <action if="status == PASS">Increment task_pass_count</action>
    <action if="status == FAIL">Increment task_fail_count</action>

    <output>  {task_name}: {status} ({structure_score}%)</output>

  </substep>

<action>After all tasks validated, display summary:</action>

  <output>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Task Validation Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Passed: {task_pass_count}/{expected_tasks}
❌ Failed: {task_fail_count}/{expected_tasks}
📊 Pass Rate: {(task_pass_count/expected_tasks)\*100}%

Framework Integration:

- Carter Tasks Found: {count}
- Damer Tasks Found: {count}
  </output>

  <template-output>task_validation_results</template-output>
  </step>

<step n="4" goal="Integration Testing" if="validation_mode == comprehensive OR validation_mode == integration-only">
  <action>Display step header</action>

  <output>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
## Step 4: Integration Testing
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  </output>

<action>Initialize integration_test_results = []</action>

  <substep n="4a" title="Text Content Pipeline Test">
    <output>
### Pipeline 1: Text Content Pipeline

Testing: research-article → format-article → publish-article → promote-content
</output>

    <ask>Do you want to run the text content pipeline test?

This will execute workflows in sequence with test data.

[y] Yes, run test
[n] No, skip this test
[s] Simulate test (check dependencies only)

Your choice [y/n/s]:
</ask>

    <check if="user selects 'y'">
      <action>Display: "Starting text content pipeline test..."</action>
      <action>Note: This requires manual workflow execution in sequence</action>
      <action>Provide test instructions:</action>

      <output>

**Test Instructions:**

1. Run research-article with test topic: "AI in Content Creation"
2. Take output article file path
3. Run format-article with article path, target: Medium
4. Run publish-article with formatted article (dry-run mode)
5. Run promote-content with published article URL

**Success Criteria:**

- Each workflow completes without errors
- Outputs are generated at each stage
- Data flows correctly between workflows
- Agent invocations work as expected

**Manual Test:**
Please execute this pipeline manually and report results.

Pipeline executed successfully? [y/n]:
</output>

      <ask>Did the text content pipeline execute successfully? [y/n]</ask>

      <action>Record result in integration_test_results</action>
    </check>

    <check if="user selects 's'">
      <action>Simulate test by checking dependencies:</action>
      - [ ] research-article workflow exists
      - [ ] format-article workflow exists
      - [ ] publish-article workflow exists
      - [ ] promote-content workflow exists
      - [ ] All required agents exist
      - [ ] Output folder structure compatible

      <action>Record simulation result</action>
    </check>

    <check if="user selects 'n'">
      <action>Record: "Text pipeline test skipped"</action>
    </check>

  </substep>

  <substep n="4b" title="Video Content Pipeline Test">
    <output>
### Pipeline 2: Video Content Pipeline

Testing: create-video-assets → publish-video → promote-content
</output>

    <ask>Do you want to run the video content pipeline test? [y/n/s]:</ask>

    <check if="user selects 'y'">
      <output>

**Test Instructions:**

1. Run create-video-assets with test content
2. Choose output mode: Production Kit
3. Take output directory path
4. Run publish-video with generated assets (dry-run)
5. Run promote-content with video URL

Pipeline executed successfully? [y/n]:
</output>

      <ask>Did the video content pipeline execute successfully? [y/n]</ask>
      <action>Record result in integration_test_results</action>
    </check>

    <check if="user selects 's'">
      <action>Simulate by checking dependencies</action>
      <action>Record simulation result</action>
    </check>

    <check if="user selects 'n'">
      <action>Record: "Video pipeline test skipped"</action>
    </check>

  </substep>

  <substep n="4c" title="Social Media Adaptation Test">
    <output>
### Pipeline 3: Social Media Adaptation

Testing: adapt-for-social-media with article/video input
</output>

    <ask>Do you want to run the social media adaptation test? [y/n/s]:</ask>

    <check if="user selects 'y'">
      <output>

**Test Instructions:**

1. Run adapt-for-social-media with test article
2. Select all platforms (Twitter, LinkedIn, Instagram, Facebook, YouTube Shorts, TikTok)
3. Verify all platform outputs generated
4. Check posting schedule created

All platform outputs generated successfully? [y/n]:
</output>

      <ask>Did all platform outputs generate successfully? [y/n]</ask>
      <action>Record result in integration_test_results</action>
    </check>

    <check if="user selects 's'">
      <action>Simulate by checking dependencies</action>
      <action>Record simulation result</action>
    </check>

    <check if="user selects 'n'">
      <action>Record: "Social media test skipped"</action>
    </check>

  </substep>

  <substep n="4d" title="Framework Integration Test">
    <output>
### Pipeline 4: Framework Integration

Testing: analyze-and-respond with Carter + Damer frameworks
</output>

    <ask>Do you want to run the framework integration test? [y/n/s]:</ask>

    <check if="user selects 'y'">
      <output>

**Test Instructions:**

1. Run analyze-and-respond with test topic/sources
2. Verify integrity-analyst invocation (Carter framework)
3. Verify fallacy-detective invocation (Damer framework)
4. Check both reports generated
5. Verify no conflicts between frameworks

Both frameworks integrated successfully? [y/n]:
</output>

      <ask>Did both frameworks integrate successfully? [y/n]</ask>
      <action>Record result in integration_test_results</action>
    </check>

    <check if="user selects 's'">
      <action>Simulate by checking:</action>
      - [ ] integrity-analyst agent exists
      - [ ] fallacy-detective agent exists
      - [ ] analyze-and-respond workflow exists
      - [ ] Framework tasks exist

      <action>Record simulation result</action>
    </check>

    <check if="user selects 'n'">
      <action>Record: "Framework test skipped"</action>
    </check>

  </substep>

<action>Display integration test summary:</action>

  <output>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Integration Testing Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Tests Run: {count}
Passed: {passed_count}
Failed: {failed_count}
Skipped: {skipped_count}
Simulated: {simulated_count}
</output>

<template-output>integration_test_results</template-output>
</step>

<step n="5" goal="Calculate Overall Validation Score">
  <action>Calculate component scores:</action>
  - agent_score = (agent_pass_count / expected_agents) * 100
  - workflow_score = (workflow_pass_count / expected_workflows) * 100
  - task_score = (task_pass_count / expected_tasks) * 100

<action>Calculate weighted overall score:</action>

- overall_score = (agent_score _ 0.3) + (workflow_score _ 0.4) + (task_score \* 0.3)

  <check if="validation_mode == comprehensive">
    <action>Add integration test score (10% weight):</action>
    - integration_score = (integration_passed / integration_total) * 100
    - overall_score = (overall_score * 0.9) + (integration_score * 0.1)
  </check>

<action>Determine overall status:</action>

- EXCELLENT: >= 95%
- GOOD: 85-94%
- ACCEPTABLE: 75-84%
- NEEDS IMPROVEMENT: 60-74%
- FAILING: < 60%

<action>Count total issues:</action>

- critical_issues_count
- warning_count
- bloat_count

<template-output>overall_validation_score</template-output>
</step>

<step n="6" goal="Generate Comprehensive Validation Report">
  <action>Compile all validation data</action>
  <action>Fill template with results</action>
  <action>Save to {default_output_file}</action>

<action>Generate detailed component reports:</action>

- Save agent details to {detailed_reports_folder}/agents-report.md
- Save workflow details to {detailed_reports_folder}/workflows-report.md
- Save task details to {detailed_reports_folder}/tasks-report.md
- Save integration details to {detailed_reports_folder}/integration-report.md

<template-output>final_validation_report</template-output>

  <output>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# {target_module_name} Module Validation - COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## Overall Score: {overall_score}% - {overall_status}

### Component Scores:

- Agents: {agent_score}% ({agent_pass_count}/{expected_agents} passed)
- Workflows: {workflow_score}% ({workflow_pass_count}/{expected_workflows} passed)
- Tasks: {task_score}% ({task_pass_count}/{expected_tasks} passed)

### Issues Summary:

- Critical Issues: {critical_issues_count}
- Warnings: {warning_count}
- Bloat Detected: {bloat_count} unused variables

### Reports Generated:

- Main Report: {default_output_file}
- Detailed Reports: {detailed_reports_folder}/

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
</output>
</step>

<step n="7" goal="Provide Recommendations and Next Steps">
  <action>Analyze validation results</action>
  <action>Generate prioritized recommendations</action>

  <output>
## Recommendations

### Critical Priority (Fix Immediately):

  </output>

  <check if="critical_issues_count > 0">
    <action>List all critical issues with fix instructions</action>
  </check>

  <check if="critical_issues_count == 0">
    <output>✅ No critical issues found!</output>
  </check>

  <output>
### High Priority (Address This Week):
  </output>

<action>List high-priority warnings and improvements</action>

  <output>
### Medium Priority (Address This Month):
  </output>

<action>List medium-priority improvements</action>

  <output>
### Low Priority (Future Enhancement):
  </output>

<action>List optimization opportunities</action>

  <output>
## Next Steps

1. **Review Main Report:** {default_output_file}
2. **Review Detailed Reports:** {detailed_reports_folder}/
3. **Fix Critical Issues:** {critical_issues_count} issues require immediate attention
4. **Update Documentation:** Reflect validation status in README and TODO
5. **Re-run Validation:** After fixes, run validate-module again to verify

**Validation Command:**

```bash
@producer  # or load Producer agent
*validate-module
```

  </output>

<template-output>recommendations_and_next_steps</template-output>
</step>

</workflow>
