# Cross-Project Reference System Guide

## Overview

The Cross-Project Reference System enables sophisticated connections and dependencies between different research projects with advanced analysis capabilities, collaborative workflows, and comprehensive relationship management while preserving project isolation.

## Core Features

### 1. Project Relationship Management (`project-link` task)
- **Bidirectional Linking**: Create mutual relationships between projects with automatic reciprocal metadata updates
- **Relationship Types**: Support for dependency, reference, collaboration, successor, parent, and child relationships
- **Dependency Resolution**: Automatic circular dependency detection and resolution recommendations
- **Relationship Validation**: Continuous integrity checking and broken reference detection

### 2. Cross-Project Analysis (`project-insights` task)
- **Pattern Recognition**: Identify themes, methodologies, and insights across related projects
- **Relationship Strength Analysis**: Quantitative assessment based on shared sources and collaboration patterns
- **Trend Analysis**: Research evolution tracking across project timelines
- **Meta-Analysis**: Statistical combination of findings from multiple projects with proper attribution

### 3. Collaborative Workflows (`project-collaborate` task)
- **Team Coordination**: Multi-researcher project management with role assignment
- **Knowledge Sharing**: Shared resource management and insight propagation
- **Collaborative Annotations**: Cross-project commentary and discussion threading
- **Collaboration History**: Comprehensive tracking of team interactions and contributions

## Data Models

### Project Relationship Model
Projects store relationship metadata in `projects/{project-name}/config/relationships.json`:

```json
{
  "project_links": [
    {
      "target_project": "related-project-name",
      "relationship_type": "dependency|reference|collaboration|successor|parent|child",
      "relationship_id": "unique-identifier",
      "link_created": "2025-01-09T10:30:00.000Z",
      "link_purpose": "Human-readable description",
      "link_strength": "weak|moderate|strong|critical",
      "dependency_order": 1,
      "collaboration_status": "active|inactive|completed|archived",
      "bidirectional": true
    }
  ]
}
```

### Global Project Dependency Graph
System maintains global view in `config/project-graph.json`:

```json
{
  "graph_id": "global-project-dependency-graph",
  "nodes": ["project-1", "project-2"],
  "edges": [
    {
      "source_project": "project-1",
      "target_project": "project-2",
      "relationship_type": "dependency",
      "relationship_strength": "strong"
    }
  ],
  "analysis_results": {
    "cycles": [],
    "critical_path": ["project-1", "project-2"],
    "dependency_health": "healthy"
  }
}
```

### Cross-Project Reference Registry
Global reference tracking in `config/cross-references.json`:

```json
{
  "cross_references": [
    {
      "reference_id": "ref-001",
      "source_project": "project-1",
      "target_projects": ["project-2"],
      "reference_type": "source|analysis|insight|methodology|template",
      "reference_path": "analyses/analysis-001.md",
      "reference_context": "Methodology reference for comparative analysis",
      "bidirectional": false,
      "reference_strength": 0.8,
      "last_validated": "2025-01-09T10:30:00.000Z"
    }
  ]
}
```

## Usage Workflows

### Creating Project Relationships

1. **Initialize Relationship**:
   ```
   Use project-link task to establish connection between projects
   ```

2. **Specify Relationship Details**:
   - Choose relationship type (dependency, reference, collaboration, etc.)
   - Set relationship strength (weak, moderate, strong, critical)
   - Provide purpose and context description

3. **Automatic Processing**:
   - Bidirectional metadata creation in both projects
   - Global dependency graph updates
   - Circular dependency validation
   - Cross-reference registry updates

### Cross-Project Analysis

1. **Trigger Analysis**:
   ```
   Use project-insights task for cross-project pattern recognition
   ```

2. **Analysis Scope**:
   - Active project and its linked projects (default)
   - Specific project network analysis
   - Relationship type filtering (dependencies only, collaborations only)

3. **Results**:
   - Pattern recognition across project boundaries
   - Relationship strength assessment
   - Trend analysis and evolution tracking
   - Meta-analysis with proper attribution

### Collaborative Workflows

1. **Initialize Collaboration**:
   ```
   Use project-collaborate task for team coordination setup
   ```

2. **Collaboration Features**:
   - Shared resource management
   - Collaborative annotation system
   - Team coordination and communication
   - Knowledge sharing and inheritance

3. **Collaboration Tracking**:
   - Contributor attribution
   - Collaboration history and timeline
   - Team effectiveness metrics
   - Knowledge sharing assessment

## Integration with Previous Stories

### Story 1.1 Integration (Project Infrastructure)
- Builds on established `projects/{name}/{references,analyses,drafts,config}` structure
- Extends project metadata format with relationship information
- Maintains backward compatibility with existing project operations

### Story 1.2 Integration (Enhanced Tasks)
- Cross-project analysis utilizes enhanced analysis tasks for consistent processing
- Project-aware routing supports cross-project analysis outputs
- Maintains compatible parameter patterns and validation

### Story 1.3 Integration (Project Context Management)
- Active project context automatically includes linked project awareness
- Project status reporting includes relationship health and dependency status
- Context switching provides linked project navigation capabilities

### Story 1.4 Integration (Source Management)
- Cross-project source linking utilizes existing source management infrastructure
- Source deduplication extends to cross-project source relationship tracking
- Cross-project search enhancement leverages relationship context

## File Structure

### Task Files
- `expansion-packs/bmad-reporting-and-writing/tasks/project-link.md`
- `expansion-packs/bmad-reporting-and-writing/tasks/project-insights.md` 
- `expansion-packs/bmad-reporting-and-writing/tasks/project-collaborate.md`

### Configuration Templates
- `expansion-packs/bmad-reporting-and-writing/templates/relationships-config-template.json`
- `expansion-packs/bmad-reporting-and-writing/templates/project-graph-template.json`
- `expansion-packs/bmad-reporting-and-writing/templates/cross-references-template.json`
- `expansion-packs/bmad-reporting-and-writing/templates/collaboration-spaces-template.json`

### Runtime Configuration Storage
- `projects/{project-name}/config/relationships.json` - Project-specific relationships
- `config/project-graph.json` - Global dependency graph
- `config/cross-references.json` - Cross-project reference registry
- `config/collaboration-spaces.json` - Collaborative workspace metadata

## Best Practices

### Relationship Management
1. **Choose Appropriate Relationship Types**: Use dependency for workflow ordering, reference for knowledge connections, collaboration for active teamwork
2. **Set Realistic Strength Indicators**: Consider actual integration level and project coupling
3. **Provide Clear Purpose Descriptions**: Document why relationships exist for future reference
4. **Regular Validation**: Monitor relationship health and resolve broken references promptly

### Cross-Project Analysis
1. **Define Clear Analysis Scope**: Specify which projects and relationship types to include
2. **Maintain Source Attribution**: Ensure proper credit for insights from contributing projects
3. **Monitor Pattern Significance**: Validate statistical significance of identified patterns
4. **Document Analysis Context**: Preserve reasoning and methodology for reproducibility

### Collaboration Workflows
1. **Establish Clear Roles**: Assign appropriate collaboration roles based on project involvement
2. **Active Collaboration Management**: Regularly update collaboration status and participant activity
3. **Knowledge Sharing Protocols**: Maintain consistent practices for resource sharing and annotation
4. **Contributor Recognition**: Ensure proper attribution for collaborative contributions

### Performance Optimization
1. **Relationship Pruning**: Remove obsolete relationships to maintain graph efficiency
2. **Analysis Scope Management**: Limit cross-project analysis to relevant project networks
3. **Validation Scheduling**: Balance reference integrity with performance impact
4. **Collaboration Activity Monitoring**: Archive inactive collaborations to improve system performance

## Troubleshooting

### Common Issues
1. **Circular Dependencies**: Use dependency resolution algorithms and cycle-breaking recommendations
2. **Broken References**: Leverage reference health monitoring and repair suggestions
3. **Collaboration Conflicts**: Apply conflict resolution mechanisms for research disagreements
4. **Performance Degradation**: Optimize relationship graphs and collaboration data structures

### Error Recovery
1. **Relationship Repair**: Automatic detection and guided repair for broken relationships
2. **Reference Validation**: Comprehensive integrity checking with repair recommendations
3. **Collaboration Recovery**: Fallback procedures for collaboration continuity
4. **Data Integrity**: Backup and recovery procedures for relationship metadata
