# Project Lifecycle and Archive Management Guide

## Overview

The Project Lifecycle and Archive Management system provides comprehensive project lifecycle progression, archival capabilities, and restoration functionality while maintaining integration with all existing project management features from Stories 1.1-1.5.

## Core Features

### 1. Enhanced Lifecycle Management
- **Status Progression**: Active → Review → Completed → Archived
- **Lifecycle History**: Complete audit trail of status changes with timestamps and reasons
- **Archive Readiness**: Automated assessment of project completion and archival eligibility
- **Status Validation**: Business rule enforcement preventing invalid lifecycle transitions

### 2. Project Archive Management (`project-archive` task)
- **Comprehensive Archival**: Complete project preservation including all analyses, sources, and relationships
- **Archive Organization**: Structured archive storage with `archive/{year}/{project-name}/` organization
- **Cross-Project Integration**: Preserve relationships and collaboration spaces during archival
- **Data Integrity**: Full validation and hash verification for archived content

### 3. Project Restoration (`project-restore` task)
- **Complete Restoration**: Full project recovery with all functionality and relationships intact
- **Conflict Resolution**: Handle name conflicts and workspace management during restoration
- **Integration Validation**: Ensure restored projects maintain compatibility with current system
- **Restoration History**: Track restoration events and access patterns

### 4. Enhanced Project Status (`project-status` task)
- **Lifecycle Information**: Current status, history, and progression recommendations
- **Archive Status**: Archive eligibility, restoration history, and backup information
- **Cross-Project Context**: Relationship health and collaboration space participation
- **Comprehensive Metrics**: Storage utilization, activity patterns, and lifecycle analytics

## Project Lifecycle States

### Active
- **Description**: Projects currently being researched with ongoing analysis and content development
- **Characteristics**: Full functionality, analysis tasks available, collaboration active
- **Next Steps**: Continue research, add sources, perform analysis, progress toward completion

### Review
- **Description**: Projects with completed research pending final review and validation
- **Characteristics**: Research complete, analysis finished, preparing for completion or archival
- **Next Steps**: Final review, validation, completion confirmation, or return to active status

### Completed
- **Description**: Projects with finished research ready for archival or long-term storage
- **Characteristics**: All research objectives met, analysis complete, findings documented
- **Next Steps**: Archive project, maintain for reference, or reactivate for additional research

### Archived
- **Description**: Projects moved to archive storage for long-term preservation and space optimization
- **Characteristics**: Preserved in archive, searchable but not active, restoration available
- **Next Steps**: Restore if needed, maintain archive integrity, long-term preservation

## Archive System Architecture

### Archive Directory Structure
```
archive/
├── 2025/
│   ├── project-name/
│   │   ├── references/
│   │   ├── analyses/
│   │   ├── drafts/
│   │   ├── config/
│   │   └── archive-info.json
│   └── another-project/
├── 2024/
└── index.json
```

### Archive Metadata Components
- **Archive Information**: Date, reason, size, integrity hash
- **Lifecycle History**: Complete status transition log
- **Preserved Components**: Inventory of archived files and directories
- **Cross-Project Relationships**: Maintained relationship links and collaboration data
- **Restoration Information**: Conflict resolution and restoration requirements
- **Search Metadata**: Keywords, categories, and indexable content

## Integration with Previous Stories

### Story 1.1 Integration (Project Infrastructure)
- **Directory Structure**: Archive system extends established `projects/{name}` patterns
- **Metadata Format**: Enhanced project.json with lifecycle and archive information
- **Backward Compatibility**: Existing projects automatically gain lifecycle management capabilities

### Story 1.2 Integration (Enhanced Tasks)
- **Project-Aware Parameters**: Archive and restore tasks utilize established parameter patterns
- **Task Routing**: Archived projects handle task routing with appropriate status validation
- **Enhanced Analysis**: Archived projects remain accessible for cross-project analysis

### Story 1.3 Integration (Project Context Management)
- **Context Switching**: Archive-aware context switching with lifecycle status information
- **Session Persistence**: Maintain context across archive/restore operations
- **Status Reporting**: Enhanced status reporting includes lifecycle and archive information

### Story 1.4 Integration (Source Management)
- **Source Preservation**: Archive operations preserve all source materials and version history
- **Cross-Project Sources**: Maintain source relationships and deduplication across archive boundaries
- **Search Integration**: Archive search extends existing source search capabilities

### Story 1.5 Integration (Cross-Project References)
- **Relationship Preservation**: Archive operations maintain cross-project relationships
- **Dependency Management**: Archive status reflected in dependency graphs and visualizations
- **Collaboration Spaces**: Archived projects maintain collaboration space participation with status updates

## Usage Workflows

### Archiving a Completed Project

1. **Prepare for Archive**:
   ```
   Use project-status to assess archive readiness and completion status
   ```

2. **Execute Archive Operation**:
   ```
   Use project-archive task to move project to archive storage
   ```

3. **Workflow**:
   - Validate project completion and archive eligibility
   - Preserve all project components and relationships
   - Update cross-project references and collaboration spaces
   - Create comprehensive archive metadata and integrity validation
   - Clean up active workspace and update project listings

### Restoring an Archived Project

1. **Browse Available Archives**:
   ```
   Use project-restore task to view archived projects
   ```

2. **Execute Restoration**:
   ```
   Select project for restoration with conflict resolution options
   ```

3. **Workflow**:
   - Validate archive integrity and restoration requirements
   - Resolve workspace conflicts and name collisions
   - Restore complete project structure and functionality
   - Reactivate cross-project relationships and collaboration spaces
   - Update project status and context management

### Managing Project Lifecycle

1. **Monitor Project Status**:
   ```
   Use project-status for comprehensive lifecycle and archive information
   ```

2. **Progress Lifecycle States**:
   - **Active → Review**: Research objectives met, ready for validation
   - **Review → Completed**: Validation complete, findings documented
   - **Completed → Archived**: Long-term preservation and workspace optimization
   - **Archived → Active**: Restoration for additional research or reference

3. **Lifecycle Validation**:
   - Automated readiness assessment for each transition
   - Business rule enforcement preventing invalid progressions
   - Cross-project dependency validation before archival
   - Collaboration space impact analysis and management

## File Locations and Configuration

### Task Files
- `expansion-packs/bmad-reporting-and-writing/tasks/project-archive.md`
- `expansion-packs/bmad-reporting-and-writing/tasks/project-restore.md`
- Enhanced `expansion-packs/bmad-reporting-and-writing/tasks/project-status.md`

### Configuration Templates
- `expansion-packs/bmad-reporting-and-writing/templates/archive-metadata-template.json`
- `expansion-packs/bmad-reporting-and-writing/templates/archive-index-template.json`
- `expansion-packs/bmad-reporting-and-writing/templates/enhanced-project-metadata-template.json`

### Runtime Configuration
- `archive/index.json` - Global archive registry
- `archive/{year}/{project-name}/archive-info.json` - Individual archive metadata
- Enhanced `projects/{project-name}/config/project.json` - Lifecycle information

## Best Practices

### Lifecycle Management
1. **Regular Status Review**: Periodically assess project lifecycle status and progression opportunities
2. **Archive Readiness**: Ensure research completion and dependency resolution before archival
3. **Collaboration Coordination**: Communicate lifecycle transitions with collaboration space participants
4. **Documentation Standards**: Maintain clear lifecycle history and transition reasoning

### Archive Operations
1. **Pre-Archive Validation**: Verify project completion and cross-project dependency resolution
2. **Archive Organization**: Use consistent naming and categorization for efficient archive management
3. **Integrity Monitoring**: Regular archive health checks and backup validation
4. **Storage Optimization**: Balance archive accessibility with storage efficiency

### Restoration Procedures
1. **Archive Assessment**: Validate archive integrity before restoration operations
2. **Conflict Resolution**: Plan for name conflicts and workspace management
3. **Integration Testing**: Verify restored project functionality with current system
4. **Post-Restoration Validation**: Confirm complete functionality and relationship restoration

### Cross-Project Considerations
1. **Relationship Impact**: Consider cross-project relationships before archival decisions
2. **Collaboration Continuity**: Maintain collaboration space functionality with archived participants
3. **Dependency Management**: Ensure dependent projects can function with archived project status
4. **Search Integration**: Maintain archive searchability for cross-project discovery

## Performance and Scalability

### Archive Performance
- **Efficient Storage**: Optimized archive organization and compression for large project portfolios
- **Fast Search**: Indexed archive metadata for quick discovery without loading full archives
- **Scalable Operations**: Archive/restore operations designed for extensive project networks
- **Memory Efficiency**: Minimal memory footprint for archive management operations

### Integration Performance
- **Backward Compatibility**: No performance impact on existing single-project workflows
- **Cross-Project Efficiency**: Efficient relationship management across archive boundaries  
- **Context Switching**: Fast lifecycle-aware context switching and status reporting
- **Search Optimization**: Archive search integrated with existing search capabilities

## Troubleshooting

### Common Archive Issues
1. **Storage Limitations**: Monitor archive storage capacity and implement cleanup procedures
2. **Integrity Failures**: Address archive corruption with backup restoration and re-archival
3. **Relationship Conflicts**: Resolve cross-project reference conflicts during archival/restoration
4. **Permission Issues**: Ensure appropriate access permissions for archive operations

### Restoration Problems
1. **Name Conflicts**: Use restoration conflict resolution options for workspace management
2. **Version Compatibility**: Address compatibility issues with restored projects and current system
3. **Missing Dependencies**: Handle missing cross-project dependencies during restoration
4. **Integration Failures**: Troubleshoot restored project integration with current workflows

### Lifecycle Management Issues
1. **Invalid Transitions**: Review business rules and readiness criteria for lifecycle progression
2. **Archive Readiness**: Address incomplete research or unresolved dependencies blocking archival
3. **Status Conflicts**: Resolve cross-project status conflicts and collaboration space impacts
4. **Data Consistency**: Maintain data consistency across lifecycle transitions and operations

## Migration and Upgrade Considerations

### Existing Project Migration
- Automatic lifecycle management activation for existing projects
- Backward compatibility with existing project metadata and structure
- Seamless integration with established workflows and analysis tasks
- Optional enhancement of existing projects with lifecycle features

### Archive Format Evolution
- Forward compatibility for archive format updates and system upgrades
- Migration tools for archive format conversion and preservation
- Backup and recovery procedures during system transitions
- Long-term preservation strategies for research data integrity