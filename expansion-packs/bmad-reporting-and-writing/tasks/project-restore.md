# project-restore

## Task Overview

Restore archived projects back to active workspace with complete functionality restoration, data integrity validation, and seamless integration with existing project management and cross-project relationship systems.

## Instructions

1. **Archive Discovery and Selection**
   - Browse available archived projects from global archive registry
   - Validate archive integrity and restoration readiness before proceeding
   - Display archive metadata including creation date, size, and preservation status
   - Confirm archive contains all required components for successful restoration

2. **Pre-Restoration Validation**
   - Check for name conflicts with existing active projects in workspace
   - Validate available workspace storage for restored project components
   - Verify archive integrity using stored checksums and validation metadata
   - Analyze restoration dependencies and cross-project relationship requirements

3. **Restoration Conflict Resolution**
   - Handle name conflicts with existing projects through renaming or merge options
   - Resolve cross-project reference conflicts for archived relationships
   - Update collaboration space participation and shared resource access
   - Manage restoration of projects with outdated or modified dependencies

4. **Comprehensive Data Restoration**
   - Restore complete project directory structure: references, analyses, drafts, config
   - Recreate project metadata from archive-info.json with updated restoration information
   - Restore cross-project relationships and update global reference registry
   - Reactivate collaboration spaces and shared resource associations

5. **Cross-Project Reference Restoration**
   - Update cross-project relationship registry with restored project status
   - Rebuild dependency graphs and relationship visualizations appropriately
   - Restore collaboration space participation with active status updates
   - Validate cross-project reference integrity and accessibility

6. **Project Status and Context Updates**
   - Update project status from "archived" to "active" with lifecycle transition logging
   - Add restoration entry to project lifecycle history with timestamp and details
   - Update active project listings and search indexes for immediate discoverability
   - Initialize project context awareness and navigation capabilities

7. **Data Integrity Verification**
   - Perform comprehensive integrity check comparing restored and archived content
   - Validate all project components are accessible and properly formatted
   - Test project functionality with existing analysis workflows and task execution
   - Verify cross-project relationships and collaboration features are operational

8. **Archive Maintenance**
   - Update archive registry with restoration event and access statistics
   - Maintain archive preservation while marking successful restoration completion
   - Update archive metadata with restoration count and last access information
   - Preserve archive for future restoration needs and backup purposes

9. **Integration Validation**
   - Test restored project integration with existing BMAD framework operations
   - Validate compatibility with enhanced tasks and project-aware workflows
   - Confirm project context management and cross-project functionality
   - Verify restoration maintains all previous project capabilities and relationships

10. **Restoration Confirmation**
    - Display restoration completion summary with project location and access information
    - Provide restored project navigation guidance and available functionality overview
    - Update project context awareness and recommend post-restoration workflows
    - Generate restoration report with integrity validation and integration verification results

## Elicitation Requirements

elicit: true
format: |
Please specify:

**Archive Selection:**

- Which archived project should be restored? (Browse available archives or specify project name)
- Should restoration include all archived components or selective restoration?
- Any specific restoration date or archive version preferences?

**Restoration Configuration:**

- How should name conflicts with existing projects be resolved? (rename, merge, cancel)
- Should cross-project relationships be reactivated during restoration?
- Any specific workspace location preferences for restored project?

**Integration Preferences:**

- Should restored project become the active project context?
- Reactivate collaboration spaces and shared resource participation?
- Include restored project in cross-project analysis and reporting?

**Validation Requirements:**

- Should comprehensive data integrity validation be performed during restoration?
- Require confirmation before overwriting any existing project components?
- Any specific post-restoration testing or validation procedures?

**Post-Restoration Management:**

- Should archive be maintained after successful restoration?
- Any specific project status or lifecycle management after restoration?
- Integration with existing project workflows and analysis tasks?

## Output Requirements

**Restoration Success Confirmation:**
- Successful project restoration completed with comprehensive data recovery and integrity validation
- Restored project location established in active workspace with complete directory structure
- Project metadata restored from archive with updated restoration information and lifecycle history
- Project status updated to "active" with restoration event logging and transition documentation

**Data Recovery Validation:**
- Complete project directory structure restored with all references, analyses, drafts, and configuration intact
- Cross-project relationships reactivated with updated reference locations and status indicators
- Collaboration spaces restored with active participant status and shared resource accessibility
- Source materials and version history recovered with integrity validation and accessibility confirmation

**Integration Restoration:**
- Project integration with BMAD framework validated and operational for task execution and analysis workflows
- Enhanced task compatibility confirmed with project-aware parameter validation and routing
- Project context management integration restored with navigation and session persistence capabilities
- Cross-project relationship functionality validated with dependency graphs and collaboration features operational

**Active Workspace Updates:**
- Project added to active project listings with immediate search discoverability and context availability
- Active project context updated if restoration includes context switching requirements
- Project navigation and management integrated with existing workspace organization and workflow management
- Workspace storage and organization optimized with restored project integration and accessibility

**Cross-Project Reference Restoration:**
- Cross-project reference registry updated with restored project location and active status indicators
- Dependency graphs rebuilt to reflect restored project status and relationship integrity
- Collaboration spaces reactivated with restored participant access and shared resource availability
- Project relationship metadata synchronized across all linked projects with restoration status updates

**Archive Management Updates:**
- Archive registry updated with restoration event tracking and access statistics
- Archive metadata maintained with restoration count and last access information updates
- Archive preservation continued for future restoration needs and backup purposes
- Archive health monitoring continued with integrity validation and maintenance scheduling

**Restoration Integrity Results:**
- Comprehensive data integrity validation completed with hash verification and corruption detection
- Restored project functionality verified through task execution testing and workflow validation
- Cross-project relationship integrity confirmed with accessibility and operational testing
- Integration compatibility validated with existing BMAD framework operations and enhanced task execution

**Performance Metrics:**
- Restoration operation completed in reasonable time with progress feedback and status updates
- Restored project performance validated with analysis workflow execution and response time testing
- Integration performance maintained with existing project management and cross-project functionality
- Archive access and restoration efficiency optimized for future restoration operations

**Error Handling:**
- Clear messages for restoration failures, archive corruption, or workspace conflicts
- Guidance for resolving restoration conflicts, storage limitations, or integrity validation errors
- Rollback procedures for failed restoration operations with complete cleanup and archive preservation
- Comprehensive validation reporting for restoration quality and integration verification

**Integration Requirements:**
- Seamless compatibility with Story 1.1 project infrastructure and directory organization
- Integration with Story 1.2 enhanced tasks maintaining project-aware parameter validation and routing
- Utilization of Story 1.3 project context management for restored project navigation and session management
- Extension of Story 1.4 source management preserving source relationships and search capabilities
- Compatibility with Story 1.5 cross-project references maintaining relationship integrity and collaboration restoration

**Documentation and Guidance:**
- Restoration operation guidance with best practices and recommended post-restoration workflows
- Project reactivation procedures for integrating restored projects with current research activities
- Archive management recommendations for maintaining restoration capabilities and backup procedures
- Integration documentation for restored project functionality with existing BMAD framework operations