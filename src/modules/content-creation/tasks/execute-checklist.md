# execute-checklist

## Task Overview

Systematically validate documentation against specialized checklists to ensure comprehensive quality assessment, completeness verification, and compliance with established standards.

## Available Checklists

If the user asks or does not specify a specific checklist, list the checklists available in the module. Available checklists include:

- conflict-of-interest-checklist.md
- context-completeness-checklist.md
- fact-verification-checklist.md
- historical-accuracy-checklist.md
- research-methodology-checklist.md
- source-credibility-checklist.md
- style-consistency-checklist.md
- voice-analysis-checklist.md

If no checklist is specified, ask the user which checklist they want to use.

## Instructions

### 1. Initial Assessment

**Checklist Selection:**

- If user or task provides a checklist name:
  - Try fuzzy matching (e.g., "integrity checklist" → "integrity-assessment-checklist")
  - If multiple matches found, ask user to clarify
  - Load the appropriate checklist from the module's tasks directory
- If no checklist specified:
  - Ask the user which checklist they want to use
  - Present the available options from the checklist files

**Processing Mode Selection:**

Confirm how they want to work through the checklist:

- **Section by section (Interactive Mode)**: Very thorough, time-consuming, allows discussion after each section
- **All at once (YOLO Mode)**: Recommended for most checklists, provides comprehensive summary at end

### 2. Document and Artifact Gathering

- Each checklist will specify its required documents/artifacts at the beginning
- Follow the checklist's specific instructions for what to gather
- Generally files can be resolved in the docs or projects folder
- If unsure, halt and ask or confirm with the user

### 3. Checklist Processing

**Interactive Mode:**

- Work through each section of the checklist one at a time
- For each section:
  - Review all items in the section following instructions for that section embedded in the checklist
  - Check each item against the relevant documentation or artifacts as appropriate
  - Present summary of findings for that section, highlighting:
    - ❌ Failures and errors
    - ⚠️ Warnings and partial passes
    - N/A items with rationale for non-applicability
  - Get user confirmation before proceeding to next section
  - If anything major is found, ask if corrective action is needed before continuing

**YOLO Mode:**

- Process all sections at once
- Create a comprehensive report of all findings
- Present the complete analysis to the user with section-by-section breakdown

### 4. Validation Approach

**For each checklist item:**

- Read and understand the requirement
- Look for evidence in the documentation that satisfies the requirement
- Consider both explicit mentions and implicit coverage
- Follow all checklist-specific LLM instructions embedded in the checklist
- Mark items as:
  - ✅ **PASS**: Requirement clearly met with sufficient evidence
  - ❌ **FAIL**: Requirement not met or insufficient coverage
  - ⚠️ **PARTIAL**: Some aspects covered but needs improvement
  - **N/A**: Not applicable to this case (provide rationale)

### 5. Section Analysis

**For each section:**

- Think step-by-step to calculate pass rate (passes / total applicable items)
- Identify common themes in failed items
- Provide specific, actionable recommendations for improvement
- In interactive mode, discuss findings with user after each section
- Document any user decisions, explanations, or clarifications

### 6. Final Report

**Prepare comprehensive summary including:**

- **Overall Checklist Completion Status**: Total pass/fail/partial/N/A counts
- **Pass Rates by Section**: Percentage breakdown for each section
- **Critical Failures**: List of high-priority failed items requiring immediate attention
- **All Failed Items**: Complete list with context and specific location references
- **Partial Passes**: Items needing improvement with recommendations
- **N/A Items**: Sections or items marked as N/A with clear justification
- **Recommendations**: Prioritized list of improvements organized by section
- **Next Steps**: Suggested actions to address failures and improve quality

## Checklist Execution Methodology

Each checklist now contains embedded LLM prompts and instructions that will:

1. **Guide thorough thinking**: Prompts ensure deep analysis of each section
2. **Request specific artifacts**: Clear instructions on what documents/access is needed
3. **Provide contextual guidance**: Section-specific prompts for better validation
4. **Generate comprehensive reports**: Final summary with detailed findings

**The LLM will:**

- Execute the complete checklist validation following embedded instructions
- Present a final report with pass/fail rates and key findings
- Offer to provide detailed analysis of any section, especially those with warnings or failures
- Maintain objectivity while being thorough and constructive
- Document all findings for future reference and improvement tracking

## Output Requirements

**During Execution:**

- Clear indication of current section and progress
- Real-time feedback on passes, failures, and partials
- Specific citations from documents when marking items

**Final Report:**

- Executive summary with overall pass rate
- Section-by-section breakdown with statistics
- Detailed findings for all non-passing items
- Actionable recommendations prioritized by impact
- Documentation references for all findings
- Saved report file for future reference (optional but recommended)

**Communication Style:**

- Objective and constructive feedback
- Specific examples and citations
- Clear explanations for all determinations
- Balanced perspective acknowledging both strengths and areas for improvement
