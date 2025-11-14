# project-link

## Task Overview

(Future - Phase 3) Establish and manage bidirectional relationships between research projects to support sophisticated multi-project research coordination.

## Instructions

1.  **Project Selection and Validation**
    - Identify a source and target project for the relationship.
    - Validate that both projects exist.
    - Check for existing relationships to prevent duplicates.

2.  **Relationship Type Classification**
    - **Dependency**: Source project depends on the target project.
    - **Reference**: Source project references materials from the target.
    - **Collaboration**: Active collaboration between projects.
    - **Successor**: Source project is a follow-up to the target.

3.  **Bidirectional Relationship Creation**
    - Create relationship metadata in the source project's config: `.bmad/projects/{source-name}/config/relationships.json`.
    - Create a reciprocal relationship in the target project's config: `.bmad/projects/{target-name}/config/relationships.json`.
    - Assign a unique relationship identifier.

4.  **Validation and Confirmation**
    - Verify that the relationship metadata was written to both projects.
    - Display a summary of the created relationship.

## Elicitation Requirements

elicit: true
format: |
Please specify:

    **Project Context (Optional):**

    - What is the source project name? (Leave blank to use active project)
    - What is the target project name to link to?

    **Relationship Details:**

    - What type of relationship should be established? (dependency, reference, collaboration, successor)
    - What is the purpose or reason for this project relationship?

## Output Requirements

**Relationship Creation Confirmation:**

- Successful bidirectional relationship established between source and target projects.
- Relationship metadata stored in both project configurations.

**Future (Phase 3) Output Requirements:**

- Updates to a global project dependency graph.
- Circular dependency analysis.
- Updates to a global cross-reference registry.

**Error Handling:**

- Clear messages for invalid or non-existent project names.
- Guidance for resolving relationship conflicts.
