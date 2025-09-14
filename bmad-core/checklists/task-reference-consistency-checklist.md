# Task Reference Consistency Checklist

## Purpose

Validate that all task name references in guidance text, documentation, and help messages correspond to actual implemented tasks. Prevent user confusion from incorrect task name recommendations.

## Pre-Review Setup

- [ ] Identify all task files in scope (core + relevant expansion packs)
- [ ] Create inventory of actual task names from file listings
- [ ] Identify all files that might contain task name references (guidance, docs, help text)

## Source File Validation

### Task Implementation Files
- [ ] **Core Tasks**: Verify `bmad-core/tasks/*.md` files exist and are properly named
- [ ] **Expansion Pack Tasks**: Check `expansion-packs/*/tasks/*.md` files in scope
- [ ] **Task Dependencies**: Validate task dependencies reference existing tasks

### Guidance Text Validation
- [ ] **Task List Files**: Check `project-list.md` and similar files for correct task references in guidance
- [ ] **Help Text**: Validate agent command definitions reference correct task names
- [ ] **Usage Guides**: Check documentation files for accurate task name examples
- [ ] **Error Messages**: Validate error messages suggest correct task names

## Cross-Reference Analysis

### Pattern Matching
- [ ] **Search for common patterns**: `project-*`, `*-create`, `*-init`, `*-activate`, `*-switch`
- [ ] **Validate variations**: Ensure task aliases are intentional and documented
- [ ] **Check formatting**: Verify consistent use of hyphens vs underscores vs spaces

### Documentation Consistency
- [ ] **Usage examples**: All examples use actual task names
- [ ] **Command lists**: All listed commands correspond to implemented tasks
- [ ] **Workflow references**: Workflow steps reference correct task names

## Build Artifact Validation

### Distribution Files
- [ ] **Built files in `dist/`**: Check that distributed agent bundles reflect source corrections
- [ ] **Team files**: Validate team configuration files use correct task references
- [ ] **Web bundles**: Ensure web-facing documentation has correct task names

## Common Anti-Patterns to Check

### Naming Inconsistencies
- [ ] **Similar Task Names**: `create-story` vs `create-next-story`, `brownfield-story` vs `brownfield-create-story`
- [ ] **Verb Consistency**: `validate` vs `validate-story`, `assess` vs `nfr-assess`
- [ ] **Hyphenation**: Consistent use of hyphens in multi-word task names
- [ ] **Verb Tenses**: Consistent verb forms (create vs creating, init vs initialize)

### Missing Task References
- [ ] **Referenced but not implemented**: Task names mentioned but no corresponding .md file
- [ ] **Implemented but not referenced**: Tasks that exist but aren't mentioned in guidance
- [ ] **Deprecated references**: Old task names that should be updated or aliased

## Correction Actions

### Source Corrections
- [ ] **Fix guidance text**: Update incorrect task name references in source files
- [ ] **Update documentation**: Correct usage guides and examples
- [ ] **Add aliases**: Create alias tasks if backward compatibility needed

### Build System Updates
- [ ] **Rebuild required**: Mark distribution files for regeneration
- [ ] **Validate changes**: Verify corrections propagate to built artifacts
- [ ] **Test references**: Confirm corrected references work as expected

## Quality Gates

### Pass Criteria
- [ ] All task references correspond to implemented tasks
- [ ] No broken references in guidance text
- [ ] Consistent naming patterns across all files
- [ ] Distribution files reflect source corrections

### Concerns Criteria
- [ ] Minor inconsistencies that don't break functionality
- [ ] Missing aliases for common alternative names
- [ ] Documentation could be clearer about available tasks

### Fail Criteria
- [ ] Core task references are broken (users can't complete workflows)
- [ ] Major inconsistencies that cause user confusion
- [ ] Distribution files contain incorrect guidance

## Prevention Measures

### Process Improvements
- [ ] **Build validation**: Add automated checking for task reference consistency
- [ ] **Review templates**: Include consistency check in standard QA review
- [ ] **Documentation standards**: Establish naming conventions for task references

### Tools and Automation
- [ ] **Script validation**: Create tool to validate task references automatically
- [ ] **Pre-commit hooks**: Prevent commits with broken task references
- [ ] **CI integration**: Include consistency checking in continuous integration

## Completion Checklist

- [ ] All task references validated against implementations
- [ ] Any inconsistencies corrected in source files
- [ ] Distribution files rebuilt if needed
- [ ] Documentation updated to reflect corrections
- [ ] Prevention measures implemented for future reviews

## Notes Section

[Document specific findings, corrections made, and recommendations for preventing similar issues]

---

**Quality Assurance Use**: This checklist should be used during story reviews when task references are added or modified, and periodically as part of system-wide consistency audits.

