# project-link

## Task Overview

Establish and manage bidirectional relationships between research projects with comprehensive dependency tracking, referential integrity validation, and collaborative workflow support for sophisticated multi-project research coordination.

## Instructions

1. **Project Selection and Validation**
   - Identify source project for relationship creation (use active project context if available)
   - Validate target project exists and has proper directory structure and metadata
   - Ensure both projects are compatible for the requested relationship type
   - Check for existing relationships to prevent conflicts or duplications

2. **Relationship Type Classification**
   - **Dependency**: Source project depends on target project completion or outputs
   - **Reference**: Source project references materials, findings, or insights from target project
   - **Collaboration**: Active ongoing collaboration between project teams or researchers
   - **Successor**: Source project is a follow-up or continuation of target project research
   - **Parent**: Source project spawns or oversees target project as sub-investigation
   - **Child**: Source project is a sub-component or specialized focus of target project

3. **Bidirectional Relationship Creation**
   - Create relationship metadata in source project: `projects/{source-name}/config/relationships.json`
   - Create reciprocal relationship metadata in target project: `projects/{target-name}/config/relationships.json`
   - Assign unique relationship identifier for tracking and validation
   - Set relationship strength indicator (weak, moderate, strong, critical) based on integration level

4. **Dependency Analysis and Validation**
   - Analyze existing project relationships for dependency graph construction
   - Perform circular dependency detection using graph traversal algorithms
   - Calculate dependency ordering for research workflow sequencing
   - Validate relationship consistency across entire project network

5. **Cross-Project Reference Integration**
   - Update global cross-reference registry: `config/cross-references.json`
   - Create reference tracking entries for relationship validation and integrity
   - Establish bidirectional reference paths for navigation and discovery
   - Initialize reference health monitoring for relationship maintenance

6. **Relationship Metadata and Documentation**
   - Record relationship creation timestamp and purpose description
   - Track relationship strength and collaboration status
   - Initialize dependency ordering and workflow integration metadata
   - Create relationship history for audit trail and evolution tracking

7. **Integration with Project Context Management**
   - Update project context awareness to include linked project information
   - Integrate relationship status into project status reporting from Story 1.3
   - Provide linked project navigation and context switching capabilities
   - Maintain compatibility with active project context and session management

8. **Validation and Confirmation**
   - Verify bidirectional relationship creation in both project configurations
   - Validate dependency graph consistency and circular dependency absence
   - Confirm cross-reference registry updates and integrity tracking
   - Display relationship creation summary with navigation and management guidance

## Elicitation Requirements

elicit: true
format: |
Please specify:

**Project Context (Optional):**

- Should this relationship be created from a specific source project? (Leave blank to use active project context)
- If yes, what is the source project name? (Must match an existing project from project-list)

**Relationship Details:**

- What is the target project name to link to? (Must match an existing project from project-list)
- What type of relationship should be established? (dependency, reference, collaboration, successor, parent, child)
- What is the purpose or reason for this project relationship?

**Relationship Configuration:**

- What is the relationship strength? (weak, moderate, strong, critical)
- Should this be an active collaboration or reference-only relationship?
- Any specific dependency ordering requirements or workflow implications?

**Integration Preferences:**

- Should project context navigation include this linked project?
- Any specific collaboration features needed (shared resources, annotations)?
- Integration with cross-project analysis or reporting requirements?

**Validation Requirements:**

- Should circular dependency detection be performed immediately?
- Any existing relationship conflicts to resolve or validate?
- Confirmation needed for bidirectional relationship creation?

## Output Requirements

**Relationship Creation Confirmation:**

- Successful bidirectional relationship established between source and target projects
- Relationship metadata stored in both project configurations following Project Relationship Model
- Unique relationship identifier assigned for tracking and validation
- Relationship type, strength, and purpose documented with creation timestamp

**Dependency Graph Updates:**

- Global project dependency graph updated in `config/project-graph.json`
- Circular dependency analysis completed with cycle detection results
- Dependency ordering calculated for research workflow sequencing
- Critical path analysis updated for project completion planning

**Cross-Reference Registry Updates:**

- Cross-reference entries created in `config/cross-references.json`
- Bidirectional reference paths established for navigation and discovery
- Reference health monitoring initialized for relationship integrity tracking
- Reference validation framework activated for ongoing maintenance

**Project Metadata Integration:**

- Source project metadata updated with new relationship information
- Target project metadata updated with reciprocal relationship entry
- Project context awareness enhanced with linked project information
- Integration with project status reporting and navigation capabilities

**Collaboration Framework Activation:**

- Collaboration status initialized based on relationship type
- Shared resource management prepared for collaborative workflows
- Team coordination metadata initialized for multi-researcher projects
- Collaborative annotation system activated for cross-project insights

**Navigation and Management:**

- Linked project navigation paths provided for context switching
- Relationship management commands and options documented
- Integration guidance for cross-project analysis and reporting
- Quick access paths to related project materials and analyses

**Validation Results:**

- Dependency graph consistency verification completed
- Circular dependency detection results with resolution recommendations
- Relationship conflict analysis with existing connections
- Referential integrity validation across project network

**Performance Metrics:**

- Relationship creation and validation completed in <5 seconds
- Dependency graph analysis scalable to complex project networks
- Bidirectional metadata synchronization reliable and atomic
- Integration compatibility maintained with Stories 1.1-1.4 infrastructure

**Error Handling:**

- Clear messages for invalid project names or non-existent projects
- Guidance for resolving circular dependencies and relationship conflicts
- Fallback instructions for relationship modification or removal
- Comprehensive validation reporting for relationship network health

**Integration Requirements:**

- Seamless compatibility with Story 1.1 project infrastructure and metadata format
- Integration with Story 1.2 enhanced tasks for cross-project analysis triggering
- Utilization of Story 1.3 project context management for linked project awareness
- Extension of Story 1.4 source management with cross-project source relationship tracking
