# Cross-Project Reference System

## Overview

The Cross-Project Reference System enables sophisticated connections and dependencies between different research projects while maintaining project isolation and ensuring referential integrity across the entire project network.

## Architecture Components

### 1. Project Relationship Metadata
Each project maintains its relationships in `projects/{project-name}/config/relationships.json`:

```json
{
  "project_links": [
    {
      "target_project": "related-project-name",
      "relationship_type": "dependency|reference|collaboration|successor|parent|child",
      "link_created": "2025-01-09T10:30:00.000Z",
      "link_purpose": "Human-readable description of relationship purpose",
      "link_strength": "weak|moderate|strong|critical",
      "dependency_order": 1,
      "collaboration_status": "active|inactive|completed|archived"
    }
  ],
  "last_updated": "2025-01-09T10:30:00.000Z"
}
```

### 2. Global Project Dependency Graph
Maintained in `config/project-graph.json` for network-wide analysis:

```json
{
  "graph_id": "global-dependency-graph",
  "nodes": [
    {
      "project_name": "project-a",
      "project_status": "active",
      "dependency_level": 0
    }
  ],
  "edges": [
    {
      "source_project": "project-a",
      "target_project": "project-b",
      "relationship_type": "dependency",
      "edge_weight": 0.8
    }
  ],
  "cycles": [],
  "critical_path": ["project-a", "project-b", "project-c"],
  "dependency_health": "healthy|warnings|critical|broken",
  "last_analyzed": "2025-01-09T10:30:00.000Z"
}
```

### 3. Cross-Project Reference Registry
Maintained in `config/cross-references.json` for referential integrity:

```json
{
  "references": [
    {
      "reference_id": "ref-uuid-123",
      "source_project": "project-a",
      "target_projects": ["project-b", "project-c"],
      "reference_type": "source|analysis|insight|methodology|template",
      "reference_path": "analyses/video-analysis-2025-01-09.md",
      "reference_context": "Methodology used for video analysis approach",
      "bidirectional": true,
      "reference_strength": 0.9,
      "last_validated": "2025-01-09T10:30:00.000Z"
    }
  ],
  "validation_history": [
    {
      "validation_date": "2025-01-09T10:30:00.000Z",
      "broken_references": 0,
      "validation_status": "healthy"
    }
  ]
}
```

### 4. Collaboration Spaces
Maintained in `config/collaboration-spaces.json` for team coordination:

```json
{
  "spaces": [
    {
      "space_id": "collaboration-uuid-456",
      "participating_projects": ["project-a", "project-b"],
      "team_members": [
        {
          "name": "Researcher Name",
          "role": "lead_researcher|collaborator|contributor|reviewer",
          "projects": ["project-a"]
        }
      ],
      "shared_resources": [
        {
          "resource_type": "template|methodology|source|insight",
          "resource_path": "path/to/resource",
          "shared_by": "project-a",
          "access_level": "read|write|admin"
        }
      ],
      "collaboration_status": "active",
      "created": "2025-01-09T10:30:00.000Z"
    }
  ]
}
```

## System Operations

### Relationship Creation
1. **Validation**: Ensure both projects exist and are accessible
2. **Bidirectional Setup**: Create relationship metadata in both projects
3. **Graph Update**: Update global dependency graph
4. **Reference Registration**: Add cross-references to global registry
5. **Validation**: Check for circular dependencies

### Dependency Resolution
1. **Graph Traversal**: Analyze project relationships using topological sorting
2. **Cycle Detection**: Identify circular dependencies using depth-first search
3. **Critical Path**: Calculate longest dependency chain
4. **Health Assessment**: Evaluate overall network health

### Reference Validation
1. **Integrity Check**: Verify referenced files and content exist
2. **Consistency Validation**: Ensure bidirectional references match
3. **Health Monitoring**: Track broken or outdated references
4. **Repair Suggestions**: Provide guidance for reference maintenance

## Integration Points

### Story 1.1 - Project Infrastructure
- Utilizes established project directory structure
- Extends project metadata format with relationship information
- Maintains backward compatibility with existing projects

### Story 1.2 - Enhanced Tasks  
- Cross-project analysis triggers enhanced tasks across related projects
- Project-aware routing considers relationship context
- Maintains consistent parameter patterns

### Story 1.3 - Project Context Management
- Active project context includes linked project awareness
- Navigation capabilities extended to related projects
- Status reporting includes relationship health

### Story 1.4 - Source Management
- Cross-project source linking leverages existing deduplication system
- Source relationships tracked across project boundaries
- Archive operations maintain cross-project references

## Usage Patterns

### Basic Project Linking
```bash
# Link projects with dependency relationship
project-link --source research-phase-1 --target research-phase-2 --type dependency --strength strong

# Create collaboration relationship
project-link --target collaborative-analysis --type collaboration --strength critical
```

### Cross-Project Analysis
```bash
# Analyze patterns across related projects
project-insights --include-relationships --focus patterns

# Generate relationship visualization
project-insights --visualization --include-timelines
```

### Team Collaboration
```bash
# Initialize collaboration space
project-collaborate --type shared-research --participants "researcher1,researcher2"

# Set up knowledge sharing
project-collaborate --enable-annotations --shared-resources templates,methodologies
```

## Validation and Maintenance

### Health Monitoring
- Automated reference validation on project modifications
- Dependency graph consistency checking
- Collaboration space activity monitoring
- Performance impact assessment

### Error Recovery
- Broken reference detection and repair suggestions
- Circular dependency resolution guidance
- Collaboration conflict resolution mechanisms
- Data integrity preservation during failures

### Performance Considerations
- Scalable graph algorithms for large project networks
- Efficient cross-reference validation without full content analysis
- Memory-efficient collaboration data storage
- Minimal impact on single-project operations

## Security and Isolation

### Project Boundaries
- Relationships enable connection while preserving isolation
- Cross-project access respects individual project permissions
- Collaboration features maintain data sovereignty
- Reference validation preserves project autonomy

### Data Integrity
- Atomic operations for bidirectional relationship creation
- Transactional updates for dependency graph modifications
- Consistent backup and recovery for relationship metadata
- Validation checkpoints for data consistency assurance