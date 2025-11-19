# Universal Session Pause: Workflow-Level Solution

## GOAL

Enable pause at ANY point during workflow execution (even when sub-agents are active), with minimal changes and automatic state preservation.

## KEY INSIGHT

Modify workflow.xml to check for pause signal between steps. This catches ALL execution points regardless of which agent is active, because workflow.xml controls all step execution.

---

## IMPLEMENTATION (2 Files Only)

### Part 1: Producer Agent - Add Pause Menu Item

**File:** `src/modules/content-creation/agents/producer.agent.yaml`

**Add to menu:**

```yaml
menu:
  - trigger: pause
    action: '#pause-session'
    description: 'Pause session and save state (works during any workflow)'
```

**Add to prompts:**

```yaml
prompts:
  - id: pause-session
    objective: 'Signal workflow to pause and save session state'
    instructions: |
      1. Create pause signal file: {project-root}/.bmad/projects/{active_project}/.pause-requested
      2. Write to file:
         {
           "pause_requested": true,
           "timestamp": "[current-timestamp]",
           "user_message": "[optional user input]"
         }
      3. Optional: Ask user "What to focus on when resuming? (press Enter to skip)"
      4. If provided, add to pause signal file
      5. Inform user: "Pause signal sent. Workflow will pause at next safe point."
      6. Wait for workflow to detect and complete pause
```

**Add activation (auto-load session):**

```yaml
activation:
  - step: 1
    description: 'Load module config'
    action: 'Load config.yaml'

  - step: 2
    description: 'Auto-load project session'
    action: |
      - Check .bmad/config/active-project.json
      - If exists: Load .bmad/projects/{active_project}/PRODUCTION-SESSION.md
      - Display: "Resuming {project_name} - Current Focus: [focus]"
      - Auto-log session start
```

### Part 2: Workflow Executor - Add Pause Detection

**File:** `.bmad/core/tasks/workflow.xml`

**Modify Step 2a (Process Each Instruction Step) to add pause check:**

**Location:** After line ~46 (beginning of step execution loop)

**Add pause detection logic:**

```xml
<step n="2a" goal="Process Each Instruction Step">
  <substep>For each <step> in instructions.md, execute in order:</substep>

  <!-- NEW: Check for pause signal BEFORE executing each step -->
  <substep name="check-pause-signal">
    <check>Look for {project-root}/.bmad/projects/{active_project}/.pause-requested file</check>
    <if-exists>
      <action>Read pause signal file</action>
      <action>Save current workflow state to {output_folder}/.workflow-state.json:
        {
          "workflow": "{workflow_name}",
          "current_step": "{step_number}",
          "paused_at": "[timestamp]",
          "resume_from": "{step_number}",
          "user_message": "[from pause signal]"
        }
      </action>
      <action>Append to PRODUCTION-SESSION.md Recent Activity:
        "[timestamp] Workflow paused at step {step_number}: {step_goal}"
      </action>
      <action>Update PRODUCTION-SESSION.md:
        - Session Status: "Paused"
        - Current Focus: "[user_message or 'Resume workflow: {workflow_name} at step {step_number}']"
      </action>
      <action>Delete .pause-requested file (consumed)</action>
      <action>Display to user: "✓ Workflow paused and state saved. Resume from step {step_number} when ready."</action>
      <action>HALT workflow execution - return to Producer menu</action>
    </if-exists>
  </substep>

  <!-- EXISTING: Execute current step -->
  <substep>Execute step goal and actions</substep>
  <substep>Process any invoke-agent, invoke-workflow, invoke-task tags</substep>
  <substep>Save outputs per template-output tags</substep>

  <!-- Continue to next step -->
</step>
```

---

## HOW IT WORKS

### Scenario: User Pauses During Sub-Agent Execution

```
1. User starts research-article workflow via Producer
2. Producer hands off to workflow.xml
3. Workflow.xml at step 3: Invokes archival-researcher agent
4. While archival-researcher is working, USER TYPES: pause
5. Producer receives command, creates .pause-requested file
6. Workflow.xml finishes current step (archival-researcher completes)
7. Workflow.xml checks for pause BEFORE step 4
8. Finds .pause-requested file
9. Saves workflow state (.workflow-state.json)
10. Updates PRODUCTION-SESSION.md
11. Halts execution, returns to Producer menu
12. User sees: "✓ Workflow paused at step 3. State saved."
```

**Key Point:** Pause happens at "safe points" (between workflow steps), not interrupting sub-agent mid-execution.

---

## FILES MODIFIED (Minimal - 2 Files)

1. **`src/modules/content-creation/agents/producer.agent.yaml`**
   - Add pause menu item
   - Add pause-session prompt
   - Add activation steps (session auto-load)

2. **`.bmad/core/tasks/workflow.xml`**
   - Add pause signal check in step 2a (before each step execution)
   - Add state save logic
   - Add halt execution logic

**Total: 2 files modified, ZERO sub-agent changes** ✅

---

## FILES CREATED (Templates)

1. `.bmad/config/active-project.json` - Example
2. `.bmad/projects/{project-name}/PRODUCTION-SESSION.md` - Template
3. `src/modules/content-creation/docs/session-management-guide.md` - Documentation

---

## PAUSE SIGNAL FILE STRUCTURE

**Location:** `{project-root}/.bmad/projects/{active_project}/.pause-requested`

**Content:**

```json
{
  "pause_requested": true,
  "timestamp": "2025-11-14T15:30:00Z",
  "user_message": "Need to verify sources before continuing",
  "requested_by": "Producer"
}
```

**Lifecycle:**

- Created by: Producer pause command
- Checked by: workflow.xml before each step
- Consumed by: workflow.xml (deleted after reading)
- One-time signal (not persistent)

---

## WORKFLOW STATE FILE

**Location:** `{output_folder}/.workflow-state.json`

**Content:**

```json
{
  "workflow": "research-article",
  "current_step": 3,
  "paused_at": "2025-11-14T15:30:00Z",
  "resume_from": 4,
  "user_message": "Need to verify sources",
  "config_snapshot": {
    "output_folder": "/path/to/output",
    "active_project": "my-project"
  }
}
```

**Purpose:** Enables future resume functionality (optional Phase 2 feature)

---

## USER EXPERIENCE

### Starting Session

```
/bmad:content-creation:agents:producer

Producer: "Resuming: My Article Series
          Current Focus: Continue research for AI ethics article

          Last session:
          - Started research-article workflow
          - Completed archival research (step 3)
          - Paused at step 4

          [Menu]"
```

### Working - Pause During Workflow

```
User: [selects research-article workflow]

Producer: [hands off to workflow.xml]
Workflow: Step 1: Load context ✓
Workflow: Step 2: Define scope ✓
Workflow: Step 3: Invoke archival-researcher ✓
Archival Researcher: [working...]

[USER TYPES IN PRODUCER MENU: pause]

Producer: "What to focus on when resuming? (press Enter to skip)"
User: "Need to verify source citations before analysis"
Producer: "Pause signal sent. Workflow will pause at next safe point."

Archival Researcher: [completes work] ✓
Workflow: Checking for pause... PAUSE DETECTED
Workflow: Saving state... ✓
Workflow: Updated PRODUCTION-SESSION.md ✓
Workflow: "✓ Workflow paused at step 3. State saved."

Producer: [Returns to menu]
Producer: "Session paused. Next session: Resume research-article from step 4"
Producer: "Note: Need to verify source citations before analysis"
```

### Resuming Next Session

```
/bmad:content-creation:agents:producer

Producer: "Resuming: My Article Series
          Status: Paused during research-article workflow

          Paused at: Step 3 (archival research complete)
          Resume from: Step 4 (subject analysis)
          Note: Need to verify source citations before analysis

          [Menu]

          (Future: 'resume' command to continue from step 4)"
```

---

## ADVANTAGES OF THIS APPROACH

1. **✅ Universal Coverage:** Works for ALL workflows, ALL sub-agents
2. **✅ Minimal Changes:** Only 2 files modified (Producer + workflow.xml)
3. **✅ Safe Pause Points:** Doesn't interrupt sub-agents mid-execution
4. **✅ No Sub-Agent Changes:** Existing agents work without modification
5. **✅ Automatic State Save:** Session state always preserved
6. **✅ Optional User Input:** Can capture "what's next" context
7. **✅ Signal-Based:** Clean separation between command (Producer) and execution (workflow.xml)

---

## VALIDATION STEPS

- [ ] Producer pause command creates .pause-requested file
- [ ] workflow.xml detects pause signal between steps
- [ ] Workflow saves state to .workflow-state.json
- [ ] PRODUCTION-SESSION.md updated with pause info
- [ ] workflow.xml halts execution cleanly
- [ ] Control returns to Producer menu
- [ ] User sees confirmation message
- [ ] Next session loads paused state correctly
- [ ] Works during any sub-agent execution
- [ ] Works for all workflows (not workflow-specific)

---

## FUTURE ENHANCEMENT (Optional Phase 2)

**Resume Command:**

```yaml
menu:
  - trigger: resume
    action: '#resume-workflow'
    description: 'Resume paused workflow from saved state'
```

This would:

- Load .workflow-state.json
- Restart workflow.xml at saved step number
- Continue execution from pause point

**Not included in initial implementation** to keep changes minimal.

---

## RESULT

**Universal pause capability with minimal changes:**

- ✅ Works at ANY point in ANY workflow
- ✅ Works when ANY sub-agent is executing
- ✅ Only 2 files modified
- ✅ Automatic state preservation
- ✅ Optional user context capture
- ✅ Clean pause/resume lifecycle
- ✅ No workflow-specific changes needed

---

## SESSION CONTEXT (Where We Are Now)

**Current Session:** Working on solving context loss for content-creation module

**Completed Today:**

1. ✅ Created documentation organization structure (docs/, planning/, validation/, architecture/)
2. ✅ Moved all planning docs from root to module directory
3. ✅ Created INDEX.md master navigation
4. ✅ Created STATUS.md module development dashboard
5. ✅ Created CURRENT-WORK.md module development session tracking
6. ✅ Researched BMAD project management patterns
7. ✅ Researched agent handoff and communication patterns
8. ✅ Designed universal pause solution (this document)

**Next Steps When Resuming:**

1. Implement this plan (modify producer.agent.yaml and workflow.xml)
2. Create example/template files (.bmad/config/active-project.json, PRODUCTION-SESSION.md)
3. Test pause functionality
4. Document session management in module docs
5. Return to Phase 2 validation work (agent/workflow/task validation from TASKS-2025-11-13.md)

**Key Files:**

- Plan document: `SAVE-RESTORE-STATUS.md` (this file)
- Module status: `src/modules/content-creation/STATUS.md`
- Module session: `src/modules/content-creation/CURRENT-WORK.md`
- Validation checklist: `src/modules/content-creation/TASKS-2025-11-13.md`
