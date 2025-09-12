# project-archive

## Task Overview

Manage research project and source lifecycle through comprehensive archival, storage optimization, and restoration capabilities while maintaining data integrity and research accessibility.

## Instructions

1. **Archive Scope and Planning**
   - Support multiple archive operations: full project archive, source-specific archive, collection archive
   - Validate archive readiness: ensure all pending analyses completed or explicitly deferred
   - Calculate storage requirements and optimize archive size through compression and deduplication
   - Create archive manifest with complete inventory of archived materials and metadata

2. **Source Archival Process**
   - **Individual Source Archive**: Archive specific sources while maintaining project integrity
   - **Collection Archive**: Archive entire source collections with relationship preservation
   - **Project Archive**: Comprehensive project archival with all sources, analyses, and metadata
   - Update source archive_status to 'archived' and preserve all metadata and relationships

3. **Data Preservation and Integrity**
   - Preserve all source metadata including version history and cross-references
   - Maintain analysis results and transcript files with original file structure
   - Preserve source relationships, collections, and cross-project references
   - Create integrity checksums for all archived files and metadata

4. **Archive Organization and Storage**
   - Create structured archive directories following established project patterns
   - Implement compression for analysis files and transcripts to optimize storage
   - Maintain searchable archive index for future discovery and restoration
   - Organize archives by project, date, and content type for efficient management

5. **Archive Discovery and Access**
   - Create archive inventory with search capabilities for archived material discovery
   - Maintain archive metadata for restoration planning and content verification
   - Enable preview capabilities for archived sources without full restoration
   - Provide archive statistics and storage optimization recommendations

6. **Restoration Capabilities**
   - **Individual Source Restoration**: Restore specific archived sources to active projects
   - **Collection Restoration**: Restore entire archived collections with relationships intact
   - **Project Restoration**: Full project restoration from archive with all dependencies
   - Validate restoration integrity and update metadata and cross-references appropriately

## Elicitation Requirements

elicit: true
format: |
Please specify:

**Archive Operation:**

- What would you like to archive?
  - Specific sources (provide source IDs or URLs)
  - Source collections (provide collection names)
  - Entire projects (provide project names)
  - Search-based selection (use project-search results)

**Archive Scope:**

- Should this be a permanent archive or temporary storage?
- Include all related analysis files and transcripts?
- Preserve cross-project references and relationships?

**Archive Organization:**

- Any specific archive naming or organization preferences?
- Should related sources be archived together as collections?
- Include source history and version information in archive?

**Data Retention:**

- How long should archived materials be retained?
- Any compliance or research data retention requirements?
- Should original files be removed after successful archive?

**Restoration Planning:**

- Will archived materials need restoration capabilities?
- Any specific restoration timeline or access requirements?
- Should archive include restoration instructions and metadata?

## Output Requirements

**Archive Success Confirmation:**
- Confirmation of successful archive creation with archive identifier and location
- Archive manifest listing all included sources, analyses, transcripts, and metadata
- Archive statistics: total files, compressed size, storage optimization achieved
- Archive integrity verification results and checksum validation

**Archive Organization:**
- Archives stored in structured directory: `archives/{archive-type}/{archive-date}/`
- Archive manifest file: `archives/{archive-id}/manifest.json` with complete inventory
- Archive metadata file: `archives/{archive-id}/metadata.json` with archive details and restoration info
- Compressed archive files with original directory structure preserved

**Source Status Updates:**
- Source archive_status updated to 'archived' in source registries
- Project metadata updated with archived source counts and active source adjustments
- Cross-project references maintained with archive location information
- Global source index updated to reflect archived status and archive locations

**Archive Inventory:**
- Archive added to global archive index: `config/archive-index.json`
- Archive searchable metadata for future discovery and management
- Archive access log initialization for restoration tracking
- Integration with project-search for archived source discovery

**Data Integrity:**
- File integrity checksums for all archived files and verification procedures
- Archive validation report confirming all sources and metadata preserved correctly
- Cross-reference validation ensuring archived sources maintain research relationships
- Restoration test verification confirming archive can be successfully restored

**Storage Optimization:**
- Compression statistics showing storage space savings achieved
- Deduplication report for sources archived across multiple projects
- Storage optimization recommendations for future archive operations
- Archive size and performance metrics for archive management planning

**Restoration Readiness:**
- Restoration instructions and procedures documentation in archive manifest
- Archive dependency mapping for successful restoration of related materials
- Restoration testing verification confirming archive integrity and completeness
- Integration guidance for restored sources with current project workflows

**Archive Management:**
- Archive lifecycle management recommendations and retention policy guidance
- Archive access permissions and security considerations for research data
- Migration planning for archive format updates and long-term preservation
- Backup and disaster recovery recommendations for archived research materials

**Integration with Previous Stories:**
- Compatibility with Story 1.1 project directory structure and metadata formats
- Integration with Story 1.2 enhanced task workflows for archived source reactivation
- Compatibility with Story 1.3 project context management for archive operations
- Seamless integration with project-add-source for source reactivation workflows

**Error Handling:**
- Clear messages for archive failures, insufficient storage, or permission issues
- Guidance for resolving archive conflicts and incomplete archive operations
- Recovery procedures for failed archive operations and partial archive states
- Validation instructions for confirming archive integrity and completeness

**Performance Requirements:**
- Archive operations complete efficiently with progress reporting for large projects
- Minimal impact on active project operations during archive creation
- Optimized archive storage with effective compression and deduplication
- Fast archive discovery and search capabilities for archived material management
