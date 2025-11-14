# Validate Module - Validation Checklist

## Pre-Validation Checklist

Before running the validate-module workflow, ensure:

- [ ] Module is in expected location: `src/modules/content-creation/`
- [ ] All component directories exist (agents/, workflows/, tasks/)
- [ ] BMad installer has been run (agents compiled to .md)
- [ ] You have reviewed the testing guide: `docs/content-creation-testing-guide.md`
- [ ] You understand the validation modes (comprehensive, quick, components-only, integration-only)

---

## Validation Execution Checklist

### Step 1: Agent Validation

- [ ] All 17 agent files discovered
- [ ] Each agent YAML structure validated
- [ ] Metadata fields complete (id, name, title, icon, module)
- [ ] Persona sections validated (role, identity, communication_style, principles)
- [ ] Menu commands validated (trigger, workflow, description)
- [ ] Knowledge file references verified
- [ ] Agent pass rate ≥ 80%

### Step 2: Workflow Validation

- [ ] All 8 workflow directories discovered
- [ ] validate-module excluded from validation
- [ ] workflow.yaml files validated
- [ ] Standard config block verified (config_source, output_folder, user_name, etc.)
- [ ] instructions.md files validated
- [ ] Workflow structure tags verified (&lt;workflow&gt;, &lt;step&gt;, &lt;action&gt;)
- [ ] Variable alignment checked (yaml ↔ instructions ↔ template)
- [ ] Agent dependencies verified
- [ ] Unused variables identified
- [ ] Workflow pass rate ≥ 80%

### Step 3: Task Validation

- [ ] All 43 task files discovered
- [ ] Task structure validated (title, purpose, inputs, outputs)
- [ ] Framework integration verified (Carter, Damer)
- [ ] Task categories assigned
- [ ] Carter framework tasks validated (3 tasks)
- [ ] Damer framework tasks validated (3 tasks)
- [ ] Style tasks validated (4 tasks)
- [ ] Fact-checking tasks validated (4 tasks)
- [ ] Research tasks validated (5 tasks)
- [ ] Project management tasks validated (11 tasks)
- [ ] Task pass rate ≥ 80%

### Step 4: Integration Testing (if comprehensive mode)

- [ ] Text content pipeline tested (research → format → publish → promote)
- [ ] Video content pipeline tested (create-assets → publish → promote)
- [ ] Social media adaptation tested (adapt-for-social-media)
- [ ] Framework integration tested (analyze-and-respond with Carter + Damer)
- [ ] Agent coordination verified
- [ ] Data flow validated
- [ ] Integration pass rate ≥ 80%

---

## Report Generation Checklist

- [ ] Overall validation score calculated
- [ ] Component scores calculated (agents, workflows, tasks)
- [ ] Critical issues identified and counted
- [ ] Warnings identified and counted
- [ ] Bloat analysis completed
- [ ] Main validation report generated
- [ ] Detailed component reports generated (agents, workflows, tasks, integration)
- [ ] Recommendations prioritized (critical, high, medium, low)
- [ ] Next steps documented

---

## Post-Validation Checklist

### Review Phase

- [ ] Main validation report reviewed
- [ ] Detailed reports reviewed
- [ ] Critical issues understood
- [ ] Warnings analyzed
- [ ] Overall score reviewed against threshold (80%)

### Action Phase

- [ ] Critical issues documented
- [ ] High-priority items scheduled (this week)
- [ ] Medium-priority items scheduled (this month)
- [ ] Low-priority items noted (future)

### Documentation Phase

- [ ] README.md updated with validation status
- [ ] TODO.md updated with progress
- [ ] TASKS-2025-11-13.md updated with completion
- [ ] Validation report archived for reference

### Re-validation Phase (after fixes)

- [ ] Critical issues fixed
- [ ] High-priority warnings addressed
- [ ] validate-module re-run
- [ ] New validation score ≥ 85%
- [ ] Documentation updated

---

## Validation Success Criteria

### Minimum Requirements

- [ ] Overall score ≥ 80%
- [ ] Critical issues = 0
- [ ] Agent pass rate ≥ 80%
- [ ] Workflow pass rate ≥ 80%
- [ ] Task pass rate ≥ 80%
- [ ] Integration pass rate ≥ 75% (if tested)

### Recommended Standards

- [ ] Overall score ≥ 90%
- [ ] Critical issues = 0
- [ ] Warnings ≤ 5
- [ ] Variable bloat ≤ 3
- [ ] All framework tasks validated
- [ ] All integration pipelines tested

### Excellence Standards

- [ ] Overall score ≥ 95%
- [ ] Critical issues = 0
- [ ] Warnings ≤ 2
- [ ] Variable bloat = 0
- [ ] 100% agent pass rate
- [ ] 100% workflow pass rate
- [ ] 100% task pass rate
- [ ] 100% integration test pass rate

---

## Common Issues Checklist

### Configuration Issues

- [ ] communication_language missing in workflow.yaml
- [ ] config_source path incorrect
- [ ] output_folder not referencing config_source
- [ ] date not set to system-generated
- [ ] installed_path incorrect

### Agent Issues

- [ ] Metadata fields incomplete
- [ ] Menu commands missing workflow/task references
- [ ] Knowledge file paths incorrect
- [ ] Persona sections missing content
- [ ] Agent ID not following pattern

### Workflow Issues

- [ ] Required files missing (workflow.yaml, instructions.md)
- [ ] Workflow structure tags incorrect
- [ ] Variable usage misalignment
- [ ] Agent dependencies broken
- [ ] Unused variables (bloat)

### Task Issues

- [ ] Markdown structure incomplete
- [ ] Input/output specifications missing
- [ ] Framework references missing (integrity/argument tasks)
- [ ] Task categorization unclear

### Integration Issues

- [ ] Workflows not executing in sequence
- [ ] Agent invocations failing
- [ ] Data not flowing between workflows
- [ ] Output files not generated

---

## Troubleshooting Guide

### If Overall Score < 80%

1. Review critical issues first
2. Fix configuration problems
3. Address missing files
4. Verify framework integration
5. Re-run validation

### If Critical Issues > 0

1. Stop and fix immediately
2. Do not proceed to integration testing
3. Review detailed reports for fix instructions
4. Re-run validation after each fix

### If Warnings > 10

1. Review all warnings
2. Determine if acceptable or fixable
3. Prioritize by impact
4. Address high-impact warnings first

### If Integration Tests Fail

1. Verify all component validation passed first
2. Check agent compilation (run installer)
3. Test workflows individually
4. Verify agent invocations
5. Check output folder permissions

---

## Validation Frequency Recommendations

### During Active Development

- Run **Quick** validation: Daily
- Run **Components Only** validation: Weekly
- Run **Comprehensive** validation: Before merges

### Before Releases

- Run **Comprehensive** validation: Always
- Ensure overall score ≥ 90%
- Ensure critical issues = 0
- Test all integration pipelines manually

### After Major Changes

- Run **Comprehensive** validation: After agent/workflow changes
- Run **Integration Only** validation: After logic changes
- Compare scores to previous validation

---

_Use this checklist systematically to ensure thorough module validation_
