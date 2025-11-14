# project-insights

## Task Overview

(Future - Phase 3) Perform cross-project analysis and pattern recognition, aggregating insights from multiple related projects.

## Instructions

1.  **Project Network Discovery**
    - Identify a target project and its linked projects for analysis.
    - (Future - Phase 3) Analyze a project relationship graph from `.bmad/config/project-graph.json`.

2.  **Cross-Project Pattern Recognition**
    - Aggregate analysis content from the `analyses/` directories of related projects.
    - Identify recurring themes and research patterns.

3.  **Insight Aggregation and Synthesis**
    - Combine analysis results from multiple projects with proper source attribution.
    - Create meta-analysis summaries.

4.  **Cross-Project Visualization and Reporting**
    - (Future - Phase 3) Generate relationship graphs showing project connections.
    - Create insight aggregation reports.

## Elicitation Requirements

elicit: true
format: |
Please specify:

    **Project Analysis Scope:**

    - Which project should be the center of the analysis? (Leave blank to use active project)
    - Should analysis include all linked projects or specific relationship types only?

    **Analysis Focus:**

    - What type of insights are you seeking? (patterns, trends, methodologies)

## Output Requirements

**Cross-Project Pattern Analysis:**

- Identified themes, methodologies, and research patterns across related projects.

**Insight Aggregation Results:**

- Meta-analysis summaries combining findings from multiple related projects.

**Future (Phase 3) Output Requirements:**

- Relationship strength assessment.
- Trend analysis and evolution tracking.
- Relationship visualization graphs.

**Error Handling:**

- Clear messages for projects with no links or analysis files.
