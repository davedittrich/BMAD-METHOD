# validate-module Workflow - Summary

**Created:** 2025-11-13
**Module:** content-creation
**Location:** `src/modules/content-creation/workflows/validate-module/`
**Status:** ✅ Ready to Use

---

## Overview

The **validate-module** workflow is a comprehensive automated validation system for the Content Creation module. It systematically validates all 135 components (17 agents, 8 workflows, 43 tasks) and provides detailed reporting with prioritized recommendations.

---

## Quick Start

```bash
# Load Producer agent
@producer

# Run validation
*validate-module

# Follow prompts to select mode and complete validation
```

---

## Workflow Structure

### Files

```
src/modules/content-creation/workflows/validate-module/
├── workflow.yaml          # Configuration and thresholds
├── instructions.md        # 7-step validation process
├── template.md           # Detailed report template
└── checklist.md          # Validation checklist
```

### Configuration Highlights

- **Expected Components:** 68 (17 agents + 8 workflows + 43 tasks)
- **Minimum Pass Percentage:** 80%
- **Critical Issues Threshold:** 0
- **Warning Threshold:** 10
- **Validation Modes:** Comprehensive, Quick, Components-Only, Integration-Only

---

## Validation Process (7 Steps)

### Step 0: Initialize Validation Session

- Display validation overview
- Select validation mode (comprehensive/quick/components/integration)
- Create output directories

### Step 1: Agent Validation Loop (17 agents)

- **Configuration Validation:** YAML structure, metadata, persona, principles
- **Knowledge Integration Check:** Verify referenced files exist
- **Menu Command Validation:** Verify workflows/tasks referenced
- **Scoring:** 0-100 per agent, PASS ≥80%, WARN 60-79%, FAIL <60%

### Step 2: Workflow Validation Loop (8 workflows)

- **Configuration Validation:** Files, config block, standard variables
- **Instructions Validation:** Structure tags, step numbering, variable usage
- **Agent Dependency Check:** Verify all referenced agents exist
- **Bloat Detection:** Identify unused variables
- **Scoring:** 0-100 per workflow

### Step 3: Task Validation Loop (43 tasks)

- **Structure Validation:** Markdown, inputs/outputs, instructions
- **Framework Integration Check:** Carter (3 tasks), Damer (3 tasks)
- **Category Validation:** 10 categories verified
- **Scoring:** 0-100 per task

### Step 4: Integration Testing (if comprehensive mode)

- **Text Content Pipeline:** research-article → format → publish → promote
- **Video Content Pipeline:** create-video-assets → publish-video → promote
- **Social Media Adaptation:** adapt-for-social-media
- **Framework Integration:** analyze-and-respond (Carter + Damer)
- **Execution:** Manual, Simulated, or Skipped per user choice

### Step 5: Calculate Overall Validation Score

- **Agent Score:** 30% weight
- **Workflow Score:** 40% weight
- **Task Score:** 30% weight
- **Integration Score:** 10% bonus (if comprehensive)
- **Status:** EXCELLENT (≥95%), GOOD (85-94%), ACCEPTABLE (75-84%), NEEDS IMPROVEMENT (60-74%), FAILING (<60%)

### Step 6: Generate Comprehensive Validation Report

- Main report: `docs/validation-report-content-creation-{date}.md`
- Detailed reports: `docs/validation-reports/content-creation-{date}/`
  - `agents-report.md`
  - `workflows-report.md`
  - `tasks-report.md`
  - `integration-report.md` (if tested)

### Step 7: Provide Recommendations and Next Steps

- Critical Priority (fix immediately)
- High Priority (address this week)
- Medium Priority (address this month)
- Low Priority (future enhancement)

---

## Validation Modes

### 1. Comprehensive (Recommended)

- Validates all agents, workflows, tasks
- Runs integration testing
- Generates complete reports
- **Time:** 30-60 minutes (depending on manual testing)

### 2. Quick

- Configuration validation only
- No deep structure analysis
- Fast pre-check
- **Time:** 5-10 minutes

### 3. Components Only

- Agents, workflows, tasks validation
- Skips integration testing
- Good for development cycles
- **Time:** 20-30 minutes

### 4. Integration Only

- Pipeline testing only
- Requires all components validated first
- Tests workflow coordination
- **Time:** 10-20 minutes

---

## Output Reports

### Main Report Structure

```markdown
# content-creation Module - Validation Report

## Executive Summary

- Overall Score: XX%
- Status: EXCELLENT/GOOD/ACCEPTABLE/NEEDS IMPROVEMENT/FAILING

## Validation Scores

- Agents: XX% (pass/total)
- Workflows: XX% (pass/total)
- Tasks: XX% (pass/total)
- Integration: XX% (pass/total)

## Issues Summary

- Critical Issues: X
- Warnings: X
- Variable Bloat: X

## Component Details

- Agent Validation Results (17 agents)
- Workflow Validation Results (8 workflows)
- Task Validation Results (43 tasks)
- Integration Testing Results (4 pipelines)

## Recommendations

- Critical Priority
- High Priority
- Medium Priority
- Low Priority

## Next Steps

- Immediate actions
- This week
- This month
```

### Detailed Reports

Each component type gets a dedicated detailed report with:

- Individual component scores
- Specific issues and warnings
- Framework integration status
- Dependency analysis

---

## Scoring System

### Component Scoring

**PASS (≥80%):**

- Component meets all or most requirements
- Minor issues only
- Production-ready

**WARN (60-79%):**

- Component has some issues
- Functional but needs attention
- Should be fixed before production

**FAIL (<60%):**

- Component has major issues
- Not production-ready
- Requires immediate fixes

### Overall Scoring

**EXCELLENT (≥95%):**

- Module is production-ready
- Minimal issues
- High quality

**GOOD (85-94%):**

- Module is well-validated
- Some minor improvements needed
- Production-ready with caveats

**ACCEPTABLE (75-84%):**

- Module is functional
- Requires attention to warnings
- Should improve before production

**NEEDS IMPROVEMENT (60-74%):**

- Module has significant issues
- Not recommended for production
- Requires focused improvement

**FAILING (<60%):**

- Module has critical issues
- Cannot be used in production
- Requires major fixes

---

## What Gets Validated

### Agents (17 components)

**Configuration:**

- ✅ YAML structure valid
- ✅ Metadata complete (id, name, title, icon, module)
- ✅ Persona sections present (role, identity, communication_style, principles)
- ✅ Principles defined (≥3)

**Menu:**

- ✅ Menu commands defined (≥1)
- ✅ Each command has trigger, workflow, description
- ✅ Referenced workflows/tasks exist

**Knowledge:**

- ✅ Knowledge file references valid
- ✅ Files exist and readable

### Workflows (8 components)

**Files:**

- ✅ workflow.yaml exists
- ✅ instructions.md exists
- ✅ template.md exists (if document workflow)
- ✅ checklist.md exists (if validation defined)

**Configuration:**

- ✅ Standard config block (config_source, output_folder, user_name, communication_language, date)
- ✅ Variables properly defined
- ✅ Paths correct

**Instructions:**

- ✅ Workflow structure tags (&lt;workflow&gt;, &lt;step&gt;, &lt;action&gt;)
- ✅ Step numbering sequential
- ✅ Variable usage aligned with yaml

**Dependencies:**

- ✅ Referenced agents exist
- ✅ Referenced tasks exist
- ✅ No broken dependencies

**Bloat:**

- ✅ All variables used
- ✅ No unused definitions

### Tasks (43 components)

**Structure:**

- ✅ Markdown title present
- ✅ Purpose/description section
- ✅ Input specification
- ✅ Output specification
- ✅ Clear instructions

**Framework Integration:**

- ✅ Carter tasks reference Integrity Framework
- ✅ Damer tasks reference Argument Framework
- ✅ Style tasks reference style analysis
- ✅ Fact-check tasks reference verification

**Categorization:**

- ✅ Task assigned to correct category
- ✅ Aligns with module purpose

### Integration (4 pipelines)

**Text Pipeline:**

- ✅ research-article executes
- ✅ format-article executes
- ✅ publish-article executes
- ✅ promote-content executes
- ✅ Data flows correctly
- ✅ Outputs generated

**Video Pipeline:**

- ✅ create-video-assets executes
- ✅ publish-video executes
- ✅ promote-content executes
- ✅ Assets generated

**Social Media:**

- ✅ adapt-for-social-media executes
- ✅ All platform outputs generated (7 platforms)
- ✅ Posting schedule created

**Framework:**

- ✅ analyze-and-respond executes
- ✅ integrity-analyst invoked (Carter)
- ✅ fallacy-detective invoked (Damer)
- ✅ Both reports generated
- ✅ No framework conflicts

---

## Integration with Producer Agent

The validate-module workflow is accessible via the Producer agent menu:

```bash
@producer
*validate-module
```

**Menu Entry:**

- **Trigger:** `validate-module`
- **Workflow:** `bmad/content-creation/workflows/validate-module`
- **Description:** "Validate all module components (17 agents, 8 workflows, 43 tasks) with comprehensive reporting."

---

## Usage Examples

### Example 1: First-Time Validation

```bash
# Load Producer
@producer

# Run validation
*validate-module

# Select mode: 1 (Comprehensive)
# Answer integration test prompts
# Review generated reports
```

### Example 2: Quick Config Check

```bash
@producer
*validate-module

# Select mode: 2 (Quick)
# Fast config validation only
# Review issues
```

### Example 3: After Fixing Issues

```bash
@producer
*validate-module

# Select mode: 3 (Components Only)
# Verify fixes applied
# Check score improvement
```

### Example 4: Integration Testing Only

```bash
@producer
*validate-module

# Select mode: 4 (Integration Only)
# Test all pipelines
# Verify agent coordination
```

---

## Success Criteria

### Minimum Requirements

- Overall score ≥ 80%
- Critical issues = 0
- All component pass rates ≥ 80%

### Recommended Standards

- Overall score ≥ 90%
- Critical issues = 0
- Warnings ≤ 5
- Variable bloat ≤ 3

### Excellence Standards

- Overall score ≥ 95%
- Critical issues = 0
- Warnings ≤ 2
- Variable bloat = 0
- 100% pass rates

---

## Troubleshooting

### Common Issues

**Issue:** Workflows not found

- **Fix:** Verify workflow directories exist in `src/modules/content-creation/workflows/`

**Issue:** Agent knowledge files missing

- **Fix:** Check file paths in agent YAML, ensure files exist

**Issue:** Variable bloat detected

- **Fix:** Remove unused variables from workflow.yaml or add usage in instructions/template

**Issue:** Integration tests fail

- **Fix:** Ensure all component validation passed first, check agent compilation

### Getting Help

- Review checklist: `src/modules/content-creation/workflows/validate-module/checklist.md`
- Review testing guide: `docs/content-creation-testing-guide.md`
- Review detailed reports in output folder

---

## Maintenance

### Re-running Validation

After fixes, re-run validation:

```bash
@producer
*validate-module
```

Compare scores to previous validation to verify improvements.

### Validation History

Each validation generates a timestamped report. Compare reports over time to track progress.

### Updating Thresholds

Edit `workflow.yaml` to adjust:

- `minimum_pass_percentage`
- `critical_issues_threshold`
- `warning_threshold`

---

## Related Resources

- **Testing Guide:** [docs/content-creation-testing-guide.md](./content-creation-testing-guide.md)
- **Deep-Dive Analysis:** [docs/deep-dive-content-creation-module.md](./deep-dive-content-creation-module.md)
- **Task Tracking:** [src/modules/content-creation/TASKS-2025-11-13.md](../src/modules/content-creation/TASKS-2025-11-13.md)
- **Workflow Audits:** [docs/workflow-audits/](./workflow-audits/)

---

**The validate-module workflow provides complete automated validation with detailed reporting and prioritized recommendations for the Content Creation module. Use it regularly to maintain high quality and track progress!** 🎉
