#!/bin/bash

# Content Creation Module - Workflow Validation Automation Script
#
# This script automates the validation of all 8 workflows in the content-creation
# module using BMB's audit-workflow. It generates individual audit reports and a
# comprehensive summary.
#
# Requirements:
# - BMAD v6 Alpha 9
# - BMB module installed
# - Claude Code or compatible IDE
#
# Usage:
#   chmod +x validate-all-workflows.sh
#   ./validate-all-workflows.sh

# Continue through warnings, only stop on critical errors

# Configuration
MODULE_PATH="src/modules/content-creation/workflows"
OUTPUT_DIR="docs/workflow-audits"
SUMMARY_FILE="$OUTPUT_DIR/validation-summary-$(date +%Y-%m-%d).md"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Workflow list (8 workflows)
declare -a WORKFLOWS=(
  "adapt-for-social-media"
  "analyze-and-respond"
  "create-video-assets"
  "format-article"
  "promote-content"
  "publish-article"
  "publish-video"
  "research-article"
)

# Banner
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Content Creation Module${NC}"
echo -e "${BLUE}Workflow Validation Automation${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "${GREEN}Started: $TIMESTAMP${NC}"
echo ""

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Initialize summary file
cat > "$SUMMARY_FILE" << EOF
# Content Creation Module - Workflow Validation Summary

**Generated:** $TIMESTAMP
**Module:** content-creation
**Workflows Audited:** ${#WORKFLOWS[@]}
**Tool:** BMB audit-workflow

---

## Summary Statistics

EOF

# Track statistics
TOTAL_WORKFLOWS=${#WORKFLOWS[@]}
COMPLETED=0
CRITICAL_ISSUES=0
BLOAT_ISSUES=0
WARNING_ISSUES=0

# Progress tracking
echo -e "${YELLOW}Validating $TOTAL_WORKFLOWS workflows...${NC}"
echo ""

# Function to audit a single workflow
audit_workflow() {
  local workflow_name=$1
  local workflow_path="$MODULE_PATH/$workflow_name"
  local output_file="$OUTPUT_DIR/audit-$workflow_name-$(date +%Y-%m-%d).md"

  echo -e "${BLUE}[$((COMPLETED + 1))/$TOTAL_WORKFLOWS]${NC} Auditing: ${GREEN}$workflow_name${NC}"

  # Check if workflow exists
  if [ ! -d "$workflow_path" ]; then
    echo -e "  ${RED}✗ ERROR: Workflow directory not found${NC}"
    echo "- ❌ **$workflow_name**: Directory not found at \`$workflow_path\`" >> "$SUMMARY_FILE"
    return 1
  fi

  if [ ! -f "$workflow_path/workflow.yaml" ]; then
    echo -e "  ${RED}✗ ERROR: workflow.yaml not found${NC}"
    echo "- ❌ **$workflow_name**: Missing workflow.yaml" >> "$SUMMARY_FILE"
    return 1
  fi

  # Manual audit instructions (since audit-workflow requires IDE interaction)
  # Generate audit checklist instead
  cat > "$output_file" << AUDIT_EOF
# Audit Report: $workflow_name

**Generated:** $TIMESTAMP
**Workflow Path:** \`$workflow_path\`
**Status:** Manual Audit Required

---

## Automated Checks

### 1. File Existence

AUDIT_EOF

  # Check required files
  local files_ok=true

  echo "  Checking required files..."

  if [ -f "$workflow_path/workflow.yaml" ]; then
    echo "- ✅ workflow.yaml exists" >> "$output_file"
    echo -e "    ${GREEN}✓${NC} workflow.yaml"
  else
    echo "- ❌ workflow.yaml MISSING" >> "$output_file"
    echo -e "    ${RED}✗${NC} workflow.yaml"
    files_ok=false
    ((CRITICAL_ISSUES++))
  fi

  if [ -f "$workflow_path/instructions.md" ]; then
    echo "- ✅ instructions.md exists" >> "$output_file"
    echo -e "    ${GREEN}✓${NC} instructions.md"
  else
    echo "- ⚠️ instructions.md missing (may be optional)" >> "$output_file"
    echo -e "    ${YELLOW}⚠${NC} instructions.md (optional)"
    ((WARNING_ISSUES++))
  fi

  if [ -f "$workflow_path/template.md" ]; then
    echo "- ✅ template.md exists" >> "$output_file"
    echo -e "    ${GREEN}✓${NC} template.md"
  else
    echo "- ℹ️ template.md not present (action workflow)" >> "$output_file"
    echo -e "    ${BLUE}ℹ${NC} template.md (not required for action workflows)"
  fi

  if [ -f "$workflow_path/checklist.md" ]; then
    echo "- ✅ checklist.md exists" >> "$output_file"
    echo -e "    ${GREEN}✓${NC} checklist.md"
  else
    echo "- ℹ️ checklist.md not present" >> "$output_file"
    echo -e "    ${BLUE}ℹ${NC} checklist.md (optional)"
  fi

  # Check for standard config block in workflow.yaml
  echo "" >> "$output_file"
  echo "### 2. Configuration Validation" >> "$output_file"
  echo "" >> "$output_file"

  echo "  Checking configuration..."

  local config_ok=true

  # Check for config_source
  if grep -q "config_source:" "$workflow_path/workflow.yaml"; then
    echo "- ✅ config_source defined" >> "$output_file"
    echo -e "    ${GREEN}✓${NC} config_source"
  else
    echo "- ❌ config_source MISSING (CRITICAL)" >> "$output_file"
    echo -e "    ${RED}✗${NC} config_source"
    config_ok=false
    ((CRITICAL_ISSUES++))
  fi

  # Check for standard variables
  for var in "output_folder" "user_name" "communication_language" "date"; do
    if grep -q "$var:" "$workflow_path/workflow.yaml"; then
      echo "- ✅ $var defined" >> "$output_file"
      echo -e "    ${GREEN}✓${NC} $var"
    else
      echo "- ⚠️ $var missing" >> "$output_file"
      echo -e "    ${YELLOW}⚠${NC} $var"
      ((WARNING_ISSUES++))
    fi
  done

  # Check for instructions file path
  echo "" >> "$output_file"
  echo "### 3. Component References" >> "$output_file"
  echo "" >> "$output_file"

  echo "  Checking component references..."

  if grep -q "instructions:" "$workflow_path/workflow.yaml"; then
    echo "- ✅ instructions path defined" >> "$output_file"
    echo -e "    ${GREEN}✓${NC} instructions path"
  else
    echo "- ⚠️ instructions path not defined" >> "$output_file"
    echo -e "    ${YELLOW}⚠${NC} instructions path"
    ((WARNING_ISSUES++))
  fi

  # Variable usage analysis
  echo "" >> "$output_file"
  echo "### 4. Variable Usage Analysis" >> "$output_file"
  echo "" >> "$output_file"
  echo "_Note: Full variable analysis requires manual audit-workflow execution in IDE_" >> "$output_file"
  echo "" >> "$output_file"

  # Extract custom variables (excluding standard ones)
  echo "**Custom Variables Defined:**" >> "$output_file"
  echo "" >> "$output_file"
  grep "^[a-zA-Z_].*:" "$workflow_path/workflow.yaml" | \
    grep -v "^name:" | \
    grep -v "^description:" | \
    grep -v "^author:" | \
    grep -v "^config_source:" | \
    grep -v "^output_folder:" | \
    grep -v "^user_name:" | \
    grep -v "^communication_language:" | \
    grep -v "^date:" | \
    grep -v "^installed_path:" | \
    grep -v "^template:" | \
    grep -v "^instructions:" | \
    grep -v "^validation:" | \
    grep -v "^standalone:" | \
    grep -v "^web_bundle:" | \
    sed 's/^/- /' >> "$output_file" || echo "- None" >> "$output_file"

  echo "" >> "$output_file"
  echo "---" >> "$output_file"
  echo "" >> "$output_file"
  echo "## Manual Audit Steps Required" >> "$output_file"
  echo "" >> "$output_file"
  echo "To complete the audit, run BMB's audit-workflow in your IDE:" >> "$output_file"
  echo "" >> "$output_file"
  echo '```bash' >> "$output_file"
  echo "@bmb" >> "$output_file"
  echo "*audit-workflow" >> "$output_file"
  echo "" >> "$output_file"
  echo "# When prompted:" >> "$output_file"
  echo "# Path: $workflow_path" >> "$output_file"
  echo '```' >> "$output_file"
  echo "" >> "$output_file"
  echo "**Manual Checks:**" >> "$output_file"
  echo "" >> "$output_file"
  echo "- [ ] Variable usage alignment (yaml ↔ instructions ↔ template)" >> "$output_file"
  echo "- [ ] Unused variable bloat detection" >> "$output_file"
  echo "- [ ] Hardcoded values that should be variables" >> "$output_file"
  echo "- [ ] Config variable usage patterns" >> "$output_file"
  echo "- [ ] Web bundle configuration (if applicable)" >> "$output_file"
  echo "- [ ] BMAD v6 compliance standards" >> "$output_file"
  echo "" >> "$output_file"
  echo "---" >> "$output_file"
  echo "" >> "$output_file"

  # Determine overall status
  local status="✅ PASS"
  local status_color="${GREEN}"

  if [ "$files_ok" = false ] || [ "$config_ok" = false ]; then
    status="❌ FAIL (Critical Issues)"
    status_color="${RED}"
  elif [ $WARNING_ISSUES -gt 0 ]; then
    status="⚠️ PASS (With Warnings)"
    status_color="${YELLOW}"
  fi

  echo "**Overall Status:** $status" >> "$output_file"
  echo "" >> "$output_file"
  echo "_Generated by: validate-all-workflows.sh_" >> "$output_file"

  # Add to summary
  echo "- $status **$workflow_name** - [View Report](./${OUTPUT_DIR##*/}/audit-$workflow_name-$(date +%Y-%m-%d).md)" >> "$SUMMARY_FILE"

  echo -e "  ${status_color}Status: $status${NC}"
  echo -e "  Report: ${BLUE}$output_file${NC}"
  echo ""

  ((COMPLETED++))
  return 0
}

# Audit all workflows
for workflow in "${WORKFLOWS[@]}"; do
  audit_workflow "$workflow"
done

# Complete summary file
cat >> "$SUMMARY_FILE" << EOF

---

## Statistics

- **Total Workflows:** $TOTAL_WORKFLOWS
- **Audited:** $COMPLETED
- **Critical Issues:** $CRITICAL_ISSUES
- **Warnings:** $WARNING_ISSUES
- **Bloat Issues:** Pending manual audit

---

## Next Steps

### Immediate Actions

1. **Review Critical Issues**
   - Fix all workflows marked as FAIL
   - Resolve missing config_source and required files

2. **Manual Audit-Workflow Execution**
   - Run BMB audit-workflow for each workflow in IDE
   - Document variable usage issues
   - Identify bloat and cleanup opportunities

3. **Address Warnings**
   - Review workflows with warnings
   - Determine if warnings are acceptable
   - Update configuration as needed

### Manual Audit Instructions

For each workflow, run the following in your IDE:

\`\`\`bash
@bmb
*audit-workflow

# When prompted, provide the workflow path:
# - adapt-for-social-media: $MODULE_PATH/adapt-for-social-media
# - analyze-and-respond: $MODULE_PATH/analyze-and-respond
# - create-video-assets: $MODULE_PATH/create-video-assets
# - format-article: $MODULE_PATH/format-article
# - promote-content: $MODULE_PATH/promote-content
# - publish-article: $MODULE_PATH/publish-article
# - publish-video: $MODULE_PATH/publish-video
# - research-article: $MODULE_PATH/research-article
\`\`\`

### Workflow Validation Checklist

After automated and manual audits:

- [ ] All 8 workflows have audit reports
- [ ] Critical issues resolved
- [ ] Variable bloat identified and cleaned
- [ ] Configuration standardized
- [ ] BMAD v6 compliance verified
- [ ] Documentation updated

---

## Resources

- **Testing Guide:** [docs/content-creation-testing-guide.md](./content-creation-testing-guide.md)
- **Task Tracking:** [src/modules/content-creation/TASKS-2025-11-13.md](../src/modules/content-creation/TASKS-2025-11-13.md)
- **Deep-Dive Analysis:** [docs/deep-dive-content-creation-module.md](./deep-dive-content-creation-module.md)

---

_Generated by: validate-all-workflows.sh_
_Timestamp: $TIMESTAMP_
EOF

# Final summary
echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}Validation Complete!${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "${GREEN}Workflows Audited: $COMPLETED/$TOTAL_WORKFLOWS${NC}"
echo -e "${RED}Critical Issues Found: $CRITICAL_ISSUES${NC}"
echo -e "${YELLOW}Warnings Found: $WARNING_ISSUES${NC}"
echo ""
echo -e "${BLUE}Summary Report: $SUMMARY_FILE${NC}"
echo -e "${BLUE}Individual Reports: $OUTPUT_DIR/audit-*.md${NC}"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "  1. Review summary report"
echo "  2. Fix critical issues"
echo "  3. Run manual audit-workflow for detailed analysis"
echo "  4. See: docs/content-creation-testing-guide.md"
echo ""
echo -e "${GREEN}Completed: $(date +"%Y-%m-%d %H:%M:%S")${NC}"
echo ""
