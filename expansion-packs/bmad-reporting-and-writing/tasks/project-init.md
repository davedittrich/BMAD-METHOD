# project-init

## Task Overview

Initialize a new research project with standardized directory structure and metadata for organizing modular investigations without cross-contamination.

## Instructions

1. **Project Name Validation**
   - Validate project name for cross-platform file system compatibility
   - Ensure no spaces, special characters, or reserved names
   - Check project name doesn't conflict with existing projects
   - Convert to lowercase with hyphens for consistency

2. **Directory Structure Creation**
   - Create `projects/{project-name}/` base directory
   - Create subdirectories: `references/`, `analyses/`, `drafts/`, `config/`
   - Ensure directory creation follows existing expansion pack patterns
   - Add error handling for directory creation failures and permission issues

3. **Project Metadata Initialization**
   - Create project metadata JSON file with required attributes
   - Store metadata in `projects/{project-name}/config/project.json`
   - Initialize with creation timestamp and default values
   - Structure follows Project Metadata Model from architecture

4. **Validation and Confirmation**
   - Verify all directories created successfully
   - Validate metadata file format and content
   - Confirm project doesn't conflict with existing projects
   - Display project initialization summary

## Elicitation Requirements

elicit: true
format: |
Please specify:

**Project Details:**

- What is the name for your research project? (lowercase, hyphens only)
- Brief description of the investigation or topic?
- Any specific organization preferences for this project?

**Validation:**

- Should this project be set to 'active' status immediately?
- Any initial sources or references to note for future addition?

## Output Requirements

- Create standardized project directory structure
- Generate project metadata JSON file with complete attribute set
- Validate cross-platform compatibility and no conflicts
- Display confirmation of successful project initialization
- CRITICAL: Maintain backward compatibility - existing workflows unaffected
- CRITICAL: All operations use file-system approach with no external dependencies
