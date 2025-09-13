# project-archive

## Task Overview

Move completed projects to archive location with comprehensive lifecycle management, preserving all analysis outputs, source materials, and cross-project relationships while maintaining accessibility for future reference and maintaining organized active workspace.

## Instructions

1. **Project Selection and Validation**
   - Identify target project for archival (use active project context if available)
   - Validate project exists and has proper directory structure and metadata
   - Check project status and lifecycle eligibility for archival operations
   - Verify project completion requirements and archive readiness criteria

2. **Pre-Archive Preparation**
   - Analyze project components: references, analyses, drafts, configuration files
   - Calculate project size and storage requirements for archive planning
   - Identify cross-project relationships and dependencies requiring preservation
   - Generate project summary and categorization metadata for archive indexing

3. **Archive Location Preparation**
   - Create archive directory structure following `archive/{year}/{project-name}/` pattern
   - Initialize archive metadata using archive-metadata-template.json structure
   - Prepare archive index entry for global archive registry integration
   - Set up archive integrity monitoring and validation systems

4. **Comprehensive Data Migration**
   - Copy complete project directory structure preserving all files and metadata
   - Migrate project configuration including relationships.json and project.json
   - Preserve cross-project references and update global reference registry
   - Transfer collaboration spaces and shared resource associations

5. **Cross-Project Reference Management**
   - Update cross-project relationships to reflect archived project status
   - Modify dependency graphs and relationship visualizations appropriately
   - Preserve collaboration spaces with archived project participant status
   - Update global cross-reference registry with archived project location

6. **Archive Metadata Creation**
   - Generate comprehensive archive-info.json with project preservation details
   - Create lifecycle history documentation with archive reason and timestamp
   - Document preserved components with counts, sizes, and integrity information
   - Initialize search metadata with keywords, categories, and indexable content

7. **Data Integrity Validation**
   - Perform comprehensive integrity check comparing original and archived files
   - Validate archive metadata completeness and accuracy
   - Test archive accessibility and search indexing functionality
   - Generate integrity hash for future validation and corruption detection

8. **Active Project Cleanup**
   - Update active project context if archived project was current active project
   - Remove project from active project listings while preserving searchability
   - Update project status to "archived" and record lifecycle transition
   - Clean up active workspace directory after successful archive validation

9. **Archive Registry Updates**
   - Update global archive index with new archived project entry
   - Add archive search metadata for discovery and categorization
   - Update archive health monitoring and maintenance schedules
   - Initialize archive backup and redundancy protocols

10. **Confirmation and Reporting**
    - Display archive creation summary with location and access information
    - Provide archive search and restoration guidance for future reference
    - Update project context awareness and navigation capabilities
    - Generate archive completion report with integrity validation results

## Elicitation Requirements

elicit: true
format: |
Please specify:

**Project Selection:**

- Should a specific project be archived? (Leave blank to use active project context)
- If yes, what is the project name to archive? (Must match an existing active project)
- Confirm project is ready for archival (completed research, no pending analysis)?

**Archive Configuration:**

- What is the reason for archiving this project? (completed, manual_archive, storage_optimization, project_cleanup)
- Should cross-project relationships be preserved during archival?
- Any specific archive categories or tags for organization and discovery?

**Archive Policies:**

- Should archived project remain searchable in global search results?
- Include project in collaboration spaces as archived participant?
- Any specific retention policies or backup requirements?

**Integration Preferences:**

- Should active project context be updated if this is the current project?
- Any specific restoration requirements or access controls needed?
- Integration with cross-project analysis or reporting after archival?

**Validation Requirements:**

- Should comprehensive data integrity validation be performed?
- Require confirmation before removing project from active workspace?
- Any specific archive health monitoring or maintenance schedules?

## Output Requirements

**Archive Creation Confirmation:**
- Successful project archival completed with comprehensive data preservation
- Archive location established at `archive/{year}/{project-name}/` with complete directory structure
- Archive metadata stored in `archive-info.json` following Archive Metadata Model
- Project lifecycle status updated to "archived" with transition history and reasoning

**Data Preservation Validation:**
- Complete project directory structure preserved with all references, analyses, drafts, and configuration
- Cross-project relationships maintained with updated reference locations and status indicators
- Collaboration spaces updated with archived project participant status and access preservation
- Source materials and version history preserved with integrity validation and hash verification

**Archive Index Updates:**
- Global archive registry updated in `archive/index.json` with searchable project entry
- Archive search metadata generated with keywords, categories, and research domain classification
- Archive health monitoring initialized with integrity checking and maintenance scheduling
- Archive categorization updated with project classification and organizational metadata

**Cross-Project Integration:**
- Cross-project reference registry updated with archived project location and access information
- Dependency graphs modified to reflect archived project status without breaking relationship integrity
- Collaboration spaces maintained with archived participant status and shared resource preservation
- Project relationship metadata updated across all linked projects with archival status indicators

**Active Workspace Management:**
- Project removed from active project listings while maintaining search discoverability
- Active project context updated if archived project was currently selected
- Project context switching updated to handle archived project navigation appropriately
- Workspace organization improved with archive-based cleanup and storage optimization

**Archive Accessibility:**
- Archived project remains accessible through archive search and discovery mechanisms
- Direct archive access paths provided for future reference and restoration procedures
- Archive navigation integrated with existing project context and relationship management
- Search functionality extended to include archived project content and metadata

**Integrity and Validation:**
- Comprehensive data integrity validation completed with hash verification and corruption detection
- Archive metadata completeness verified with all required fields and proper format validation
- Archive accessibility tested with search indexing and discovery functionality confirmation
- Integrity monitoring activated with automated health checking and maintenance scheduling

**Performance Metrics:**
- Archive operation completed in reasonable time with progress feedback and status updates
- Archive storage optimization achieved without data loss or corruption
- Archive search indexing efficient and responsive for discovery operations
- Integration performance maintained with existing project management and analysis workflows

**Error Handling:**
- Clear messages for invalid projects, insufficient permissions, or archive creation failures
- Guidance for resolving archive conflicts, storage limitations, or integrity validation errors
- Rollback procedures for failed archive operations with complete cleanup and restoration
- Comprehensive validation reporting for archive health and integrity monitoring

**Integration Requirements:**
- Seamless compatibility with Story 1.1 project infrastructure and directory organization
- Integration with Story 1.2 enhanced tasks maintaining project-aware parameter validation
- Utilization of Story 1.3 project context management for archive-aware navigation and switching
- Extension of Story 1.4 source management preserving source relationships and search capabilities
- Compatibility with Story 1.5 cross-project references maintaining relationship integrity and collaboration preservation

**Documentation and Guidance:**
- Archive operation guidance with best practices and recommended workflows
- Restoration procedures documented for future project recovery and reactivation
- Archive management recommendations for long-term preservation and maintenance
- Integration documentation for archive functionality with existing BMAD framework operations

