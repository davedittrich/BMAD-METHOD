# {{target_module_name}} Module - Validation Report

**Generated:** {{date}}
**Validation Mode:** {{validation_mode}}
**Overall Score:** {{overall_score}}% - {{overall_status}}

---

## Executive Summary

This comprehensive validation report analyzes all {{expected_total_components}} components of the {{target_module_name}} module:
- **{{expected_agents}} Agents** - Documentary Film Crew specialized agents
- **{{expected_workflows}} Workflows** - Complete content lifecycle workflows
- **{{expected_tasks}} Tasks** - Framework-integrated task library

### Overall Status: {{overall_status}}

{{#if overall_score >= 95}}
✅ **EXCELLENT** - Module is production-ready with minimal issues.
{{else if overall_score >= 85}}
✅ **GOOD** - Module is well-validated with some minor improvements needed.
{{else if overall_score >= 75}}
⚠️ **ACCEPTABLE** - Module is functional but requires attention to warnings.
{{else if overall_score >= 60}}
⚠️ **NEEDS IMPROVEMENT** - Module has significant issues that should be addressed.
{{else}}
❌ **FAILING** - Module has critical issues preventing production use.
{{/if}}

---

## Validation Scores

| Component | Score | Passed | Total | Status |
|-----------|-------|--------|-------|--------|
| **Agents** | {{agent_score}}% | {{agent_pass_count}} | {{expected_agents}} | {{agent_status}} |
| **Workflows** | {{workflow_score}}% | {{workflow_pass_count}} | {{expected_workflows}} | {{workflow_status}} |
| **Tasks** | {{task_score}}% | {{task_pass_count}} | {{expected_tasks}} | {{task_status}} |
{{#if integration_tested}}
| **Integration** | {{integration_score}}% | {{integration_pass_count}} | {{integration_total}} | {{integration_status}} |
{{/if}}
| **OVERALL** | **{{overall_score}}%** | **{{total_pass_count}}** | **{{expected_total_components}}** | **{{overall_status}}** |

---

## Issues Summary

### Critical Issues: {{critical_issues_count}}

{{#if critical_issues_count > 0}}
{{#each critical_issues}}
**{{issue_component}}** - {{issue_type}}
- **Description:** {{issue_description}}
- **Impact:** {{issue_impact}}
- **Fix:** {{issue_fix}}
- **Priority:** CRITICAL

{{/each}}
{{else}}
✅ No critical issues detected!
{{/if}}

### Warnings: {{warning_count}}

{{#if warning_count > 0}}
{{#each warnings}}
**{{warning_component}}** - {{warning_type}}
- **Description:** {{warning_description}}
- **Impact:** {{warning_impact}}
- **Recommendation:** {{warning_recommendation}}

{{/each}}
{{else}}
✅ No warnings detected!
{{/if}}

### Variable Bloat: {{bloat_count}} unused variables

{{#if bloat_count > 0}}
{{#each bloat_items}}
- **{{bloat_component}}**: {{bloat_variable}} (defined but unused)
{{/each}}
{{else}}
✅ No unused variables detected!
{{/if}}

---

## Component Details

### Agent Validation Results ({{expected_agents}} agents)

{{#each agent_validation_results}}

#### {{agent}} - {{status}} ({{config_score}}%)

**Metadata:**
- ID: {{metadata_valid ? '✅' : '❌'}} Properly formatted
- Fields: {{persona_complete ? '✅' : '❌'}} Complete

**Menu Commands:**
- Validation: {{menu_valid ? '✅' : '❌'}} All commands valid
- Count: {{menu_command_count}} commands

**Knowledge Integration:**
{{#if knowledge_valid}}
- ✅ All knowledge files accessible
{{else if has_knowledge_refs}}
- ❌ Some knowledge files missing or inaccessible
{{else}}
- ℹ️ No knowledge files referenced
{{/if}}

**Issues:**
{{#if issues}}
{{#each issues}}
- {{this}}
{{/each}}
{{else}}
- None
{{/if}}

**Warnings:**
{{#if warnings}}
{{#each warnings}}
- {{this}}
{{/each}}
{{else}}
- None
{{/if}}

---

{{/each}}

### Workflow Validation Results ({{expected_workflows}} workflows)

{{#each workflow_validation_results}}

#### {{workflow}} - {{status}} ({{config_score}}%)

**Configuration:**
- Files: {{files_complete ? '✅' : '❌'}} All required files present
- Config Block: {{config_valid ? '✅' : '❌'}} Standard config valid
- Variables: {{variables_aligned ? '✅' : '⚠️'}} Aligned with usage

**Instructions:**
- Structure: {{instructions_valid ? '✅' : '❌'}} Valid workflow structure
- Agent Dependencies: {{agent_deps_valid ? '✅' : '⚠️'}} All agents exist

**Bloat Analysis:**
- Unused Variables: {{bloat_detected}}

**Issues:**
{{#if issues}}
{{#each issues}}
- {{this}}
{{/each}}
{{else}}
- None
{{/if}}

**Warnings:**
{{#if warnings}}
{{#each warnings}}
- {{this}}
{{/each}}
{{else}}
- None
{{/if}}

---

{{/each}}

### Task Validation Results ({{expected_tasks}} tasks)

**Tasks by Category:**

{{#each task_categories}}
**{{category_name}}** ({{category_count}} tasks)
{{#each category_tasks}}
- {{task}}: {{status}} ({{structure_score}}%)
{{/each}}

{{/each}}

**Framework Integration:**

**Carter Integrity Framework:**
{{#each carter_tasks}}
- {{this}}: {{task_validation_results[this].framework_integrated ? '✅' : '❌'}}
{{/each}}

**Damer Argument Framework:**
{{#each damer_tasks}}
- {{this}}: {{task_validation_results[this].framework_integrated ? '✅' : '❌'}}
{{/each}}

**Detailed Task Results:**

{{#each task_validation_results}}

#### {{task}} - {{status}} ({{structure_score}}%)

- **Category:** {{category}}
- **Structure:** {{structure_complete ? '✅' : '❌'}} Complete
- **Framework:** {{framework_integrated ? '✅' : 'N/A'}}

{{#if issues}}
**Issues:**
{{#each issues}}
- {{this}}
{{/each}}
{{/if}}

{{#if warnings}}
**Warnings:**
{{#each warnings}}
- {{this}}
{{/each}}
{{/if}}

{{/each}}

---

{{#if integration_tested}}

## Integration Testing Results

{{#each integration_test_results}}

### {{pipeline_name}}

**Status:** {{test_status}}
**Type:** {{test_type}} (manual / simulated / skipped)

{{#if test_type == 'manual'}}
**Execution:** {{execution_result}}
**Notes:** {{execution_notes}}
{{/if}}

{{#if test_type == 'simulated'}}
**Dependency Check:**
{{#each dependencies_checked}}
- {{dependency}}: {{valid ? '✅' : '❌'}}
{{/each}}
{{/if}}

{{/each}}

**Integration Summary:**
- Tests Run: {{integration_total}}
- Passed: {{integration_pass_count}}
- Failed: {{integration_fail_count}}
- Skipped: {{integration_skip_count}}
- Simulated: {{integration_simulated_count}}

{{/if}}

---

## Recommendations

### 🔴 Critical Priority (Fix Immediately)

{{#if critical_issues_count > 0}}
{{#each critical_recommendations}}
{{recommendation_index}}. **{{recommendation_title}}**
   - Component: {{component}}
   - Action: {{action}}
   - Estimated Time: {{estimated_time}}
   - Impact: HIGH

{{/each}}
{{else}}
✅ No critical issues requiring immediate attention.
{{/if}}

### 🟡 High Priority (Address This Week)

{{#each high_priority_recommendations}}
{{recommendation_index}}. **{{recommendation_title}}**
   - Component: {{component}}
   - Action: {{action}}
   - Estimated Time: {{estimated_time}}
   - Impact: MEDIUM

{{/each}}

### 🟢 Medium Priority (Address This Month)

{{#each medium_priority_recommendations}}
{{recommendation_index}}. **{{recommendation_title}}**
   - Component: {{component}}
   - Action: {{action}}
   - Estimated Time: {{estimated_time}}
   - Impact: LOW-MEDIUM

{{/each}}

### 🔵 Low Priority (Future Enhancement)

{{#each low_priority_recommendations}}
{{recommendation_index}}. **{{recommendation_title}}**
   - Component: {{component}}
   - Action: {{action}}
   - Benefit: {{benefit}}

{{/each}}

---

## Next Steps

### Immediate Actions

1. **Review This Report Thoroughly**
   - Focus on Critical and High Priority sections
   - Understand all issues and warnings

2. **Fix Critical Issues** ({{critical_issues_count}} issues)
{{#if critical_issues_count > 0}}
{{#each critical_issues}}
   - {{issue_component}}: {{issue_fix}}
{{/each}}
{{else}}
   - ✅ No critical issues to fix
{{/if}}

3. **Address Warnings** ({{warning_count}} warnings)
   - Review detailed reports in: {{detailed_reports_folder}}/
   - Prioritize based on impact

4. **Update Documentation**
   - Update README.md with validation status
   - Update TODO.md with Phase 2 completion status
   - Reference this report for tracking

### This Week

1. Fix all critical issues
2. Address high-priority warnings
3. Re-run validation to verify fixes
4. Begin agent manual testing

### This Month

1. Complete all component validation
2. Execute integration pipelines manually
3. Address medium-priority recommendations
4. Plan Phase 3 enhancements

---

## Validation Methodology

**Validation Mode:** {{validation_mode}}

**Components Validated:**
- Agent Configuration (YAML structure, metadata, persona, menu, knowledge)
- Workflow Configuration (files, config block, variables, instructions)
- Task Structure (markdown, inputs/outputs, framework integration)
{{#if integration_tested}}
- Integration Testing (pipeline execution, agent coordination, data flow)
{{/if}}

**Scoring Criteria:**
- **PASS:** ≥80% (Component meets all or most requirements)
- **WARN:** 60-79% (Component has minor issues)
- **FAIL:** <60% (Component has major issues)

**Overall Score Calculation:**
- Agents: 30% weight
- Workflows: 40% weight
- Tasks: 30% weight
{{#if integration_tested}}
- Integration: 10% bonus weight (when tested)
{{/if}}

---

## Detailed Reports

Additional detailed reports available:

- **Agents Report:** {{detailed_reports_folder}}/agents-report.md
- **Workflows Report:** {{detailed_reports_folder}}/workflows-report.md
- **Tasks Report:** {{detailed_reports_folder}}/tasks-report.md
{{#if integration_tested}}
- **Integration Report:** {{detailed_reports_folder}}/integration-report.md
{{/if}}

---

## Validation History

| Date | Overall Score | Critical Issues | Warnings | Status |
|------|--------------|-----------------|----------|--------|
| {{date}} | {{overall_score}}% | {{critical_issues_count}} | {{warning_count}} | {{overall_status}} |

_Previous validations will appear here on re-runs_

---

## Re-validation Instructions

To re-run validation after fixes:

```bash
# Load Producer agent
@producer

# Run validate-module workflow
*validate-module

# Select mode:
# 1 = Comprehensive (recommended after fixes)
# 2 = Quick (for config-only checks)
# 3 = Components Only (skip integration)
# 4 = Integration Only (test pipelines)
```

---

_Generated by: validate-module workflow_
_Module: {{target_module_name}}_
_Validation Date: {{date}}_
_Report Version: 1.0.0_
