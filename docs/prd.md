# BMAD-Method Brownfield Enhancement PRD

## Intro Project Analysis and Context

### Existing Project Overview

**Analysis Source**: Document-project output available (user confirmed completion)

**Current Project State**: The bmad-reporting-and-writing expansion pack (v1.0.4) is a comprehensive AI-powered journalism and content creation framework with:

**Core Purpose**: Supports independent journalism and content creation through systematic research methodology, fact-checking, and multi-platform optimization.

**Current Architecture**: Traditional linear workflow with centralized data management
- **11 Specialized Agents**: Research, content creation, and optimization teams
- **4 Complete Workflows**: Article research, YouTube production, response journalism, social media
- **15+ Research Tasks**: Including `analyze-video-content`, `distill-wisdom`, `save-transcript`
- **Centralized Storage**: Uses `references/transcripts/` and single output files

### Available Documentation Analysis

✅ **Document-project analysis available** - Using existing technical documentation
- Expansion pack README with comprehensive feature overview
- Task documentation with workflow specifications  
- Agent definitions and capabilities mapping
- Template system for structured output

### Enhancement Scope Definition

**Enhancement Type**: ✅ **Major Feature Modification** + **New Feature Addition**

**Enhancement Description**: 
Transform the expansion pack from a linear, centralized workflow to a modular, project-based system that supports iterative research and writing. Enable organization of research data, sharded documents, and analysis output into separate project containers that support exploration, expansion of reference materials, and iterative article development.

**Impact Assessment**: ✅ **Significant Impact** (substantial existing code changes)
- Requires new project organization structure
- Modifications to existing tasks for project-aware operation  
- New workflow patterns for iterative research
- Integration with existing agents while maintaining backward compatibility

### Goals and Background Context

**Goals:**
• Enable iterative, exploratory research workflow for complex article development
• Organize research materials by project/topic to prevent cross-contamination  
• Support expandable reference collection as research questions emerge
• Maintain separation between different article projects and their analysis data
• Allow pivoting and testing of features during development without losing context

**Background Context:**
The current expansion pack excels at linear research-to-publication workflows but lacks support for iterative, exploratory research common in investigative journalism. When researching complex topics that require multiple sources, follow-up questions, and iterative analysis, the current centralized approach creates confusion and context loss. The enhancement will enable systematic exploration while maintaining the pack's excellent analysis capabilities.

### Change Log
| Change | Date | Version | Description | Author |
|--------|------|---------|-------------|---------|
| Initial Analysis | 2025-01-09 | PRD-v1 | Brownfield PRD creation for modular research enhancement | PM John |

## Requirements

### Functional Requirements

**FR1**: The system shall support creation of isolated project containers that organize research data, transcripts, analysis outputs, and article drafts by topic/article without cross-contamination.

**FR2**: Existing tasks (analyze-video-content, distill-wisdom, save-transcript) shall be enhanced to operate within project context while maintaining backward compatibility for non-project use.

**FR3**: The system shall provide a project initialization workflow that creates standardized directory structure and configuration for new research projects.

**FR4**: Users shall be able to add new reference materials (YouTube videos, documents, sources) to existing projects through iterative expansion commands.

**FR5**: The system shall maintain project-specific reference tracking that links analysis outputs to their source materials within each project.

**FR6**: Analysis tasks shall generate project-aware output files that preserve context and enable cross-referencing within the project scope.

**FR7**: The system shall support project status tracking to show research progress, completed analyses, and remaining work items.

**FR8**: Users shall be able to list, switch between, and manage multiple concurrent research projects.

**FR9**: The system shall provide project archiving capabilities to preserve completed research while clearing active workspace.

### Non-Functional Requirements

**NFR1**: Project operations must maintain existing task performance characteristics without degrading analysis quality or speed.

**NFR2**: The enhanced system must preserve all existing expansion pack functionality for users not adopting project-based workflows.

**NFR3**: Project directory structures must be human-readable and accessible outside the BMAD system for transparency and portability.

**NFR4**: New project features must integrate seamlessly with existing agent workflows without requiring agent retraining or reconfiguration.

**NFR5**: System must handle project switching with minimal context loss and provide clear project boundary indicators.

### Compatibility Requirements

**CR1**: **Existing API Compatibility** - All current task invocations (e.g., `*analyze-video-content`, `*distill-wisdom`) must continue working unchanged for non-project workflows.

**CR2**: **Directory Structure Compatibility** - Current `references/transcripts/` structure must remain functional as fallback for legacy workflows.

**CR3**: **Agent Integration Consistency** - All 11 existing agents must work with both project-based and traditional workflows without behavioral changes.

**CR4**: **Template and Output Compatibility** - Existing templates and output formats must remain unchanged, with project organization as an additive layer.

## Technical Constraints and Integration Requirements

### Existing Technology Stack

**Languages**: Markdown (natural language framework), YAML (configuration), JavaScript (build tools)
**Frameworks**: BMAD Method v4+ natural language agent framework  
**Database**: File-system based (no external database dependencies)
**Infrastructure**: Node.js v20+, CLI-based execution environment
**External Dependencies**: Expansion pack integration with core BMAD installer system

### Integration Approach

**Directory Integration Strategy**: 
- Hierarchical project structure: `projects/{project-name}/{references,analyses,drafts}`
- Maintain existing `references/` as global fallback for backward compatibility
- Project-aware path resolution in modified tasks

**Task Integration Strategy**:
- Modify existing tasks to accept optional project context parameter
- Implement project detection logic for automatic context switching
- Preserve original task behavior when no project context provided

**Agent Integration Strategy**:
- No agent modifications required - agents work with enhanced tasks transparently
- Project context passed through task execution rather than agent awareness
- Maintain existing agent command interfaces and behaviors

**Workflow Integration Strategy**:
- Extend existing workflows with optional project initialization step
- Project-aware file routing in analysis and output tasks
- Backward compatible workflow execution for non-project users

### Code Organization and Standards

**File Structure Approach**: Follow existing expansion pack patterns with new project management tasks added to `tasks/` directory

**Naming Conventions**: Maintain current BMAD naming standards, prefix new project tasks with `project-` (e.g., `project-init.md`, `project-add-source.md`)  

**Documentation Standards**: Update existing task documentation with project usage examples while preserving original usage patterns

### Deployment and Operations  

**Build Process Integration**: No changes to existing build process - new tasks auto-detected by standard BMAD build system

**Configuration Management**: Extend existing `config.yaml` with optional project settings, maintain backward compatibility

### Risk Assessment and Mitigation

**Technical Risks**:
- Path resolution complexity in cross-platform environments
- File organization conflicts with existing user workflows
- Performance impact of project context checking

**Integration Risks**: 
- Breaking changes to existing user workflows
- Agent confusion with multiple project contexts
- Template output routing errors

**Deployment Risks**:
- User adoption resistance to new workflow patterns  
- Migration complexity for existing research in progress

**Mitigation Strategies**:
- Comprehensive backward compatibility testing
- Gradual rollout with legacy support
- Clear migration documentation and optional adoption

## Epic and Story Structure

### Epic Approach

**Epic Structure Decision**: Single comprehensive epic with rationale: The features are tightly interdependent (project creation, task enhancement, routing), modular development allows testing each component while maintaining system integrity, and single epic maintains architectural coherence while enabling iterative development.

# Epic 1: Modular Research Project Management Enhancement

**Epic Goal**: Transform the bmad-reporting-and-writing expansion pack to support iterative, project-based research workflows that organize materials, analysis, and outputs by topic while maintaining full backward compatibility.

**Integration Requirements**: 
- All existing workflows must remain functional
- New features must integrate transparently with existing agents
- Project organization must be additive, not disruptive
- File system approach must maintain BMAD's natural language framework principles

## Story 1.1: Project Infrastructure Foundation

As a research journalist,
I want to initialize isolated research projects with standardized directory structure,
so that I can organize multiple concurrent investigations without cross-contamination.

### Acceptance Criteria

1. `project-init` task creates standardized directory structure (`projects/{project-name}/{references,analyses,drafts,config}`)
2. Project initialization includes project metadata file with creation date, description, and status tracking
3. Project directory structure follows existing expansion pack patterns for consistency
4. Multiple projects can exist simultaneously without conflicts
5. Project names are validated to prevent file system issues across platforms

### Integration Verification

**IV1**: Existing workflows continue to function normally when no project context is active
**IV2**: Global `references/` directory remains functional as fallback for legacy operations  
**IV3**: No performance degradation in non-project task execution

## Story 1.2: Project-Aware Task Enhancement

As a research journalist,
I want existing analysis tasks to operate within project context when specified,
so that my research outputs are properly organized by project while preserving existing functionality.

### Acceptance Criteria

1. `analyze-video-content` task accepts optional project parameter and routes outputs to project directories
2. `distill-wisdom` task integrates with project structure for organized analysis storage
3. `save-transcript` task stores transcripts in project-specific locations when project context provided
4. All enhanced tasks maintain full backward compatibility for non-project usage
5. Project context parameter uses consistent naming convention across all tasks

### Integration Verification

**IV1**: Non-project task invocations produce identical results to current behavior
**IV2**: Existing agent workflows continue without modification when using enhanced tasks
**IV3**: Output file formats and content remain unchanged, only location routing differs

## Story 1.3: Project Context Management

As a research journalist,
I want to set active project context and switch between projects efficiently,
so that I can work on multiple investigations without manually specifying project parameters.

### Acceptance Criteria

1. `project-activate` task sets current project context for subsequent operations
2. `project-list` task shows all available projects with status and recent activity
3. `project-status` task displays current project progress and analysis inventory  
4. Project context persists across task executions within same session
5. Clear indicators show which project is currently active

### Integration Verification

**IV1**: Project switching doesn't affect existing non-project workflows
**IV2**: Context management doesn't interfere with agent execution or memory
**IV3**: Project status tracking remains accurate across context switches

## Story 1.4: Iterative Source Management

As a research journalist, 
I want to add new reference materials to existing projects through dedicated commands,
so that I can expand my research iteratively as new questions and sources emerge.

### Acceptance Criteria

1. `project-add-source` task integrates new YouTube videos, documents, or references into existing project structure
2. Source addition automatically triggers appropriate analysis based on content type
3. New sources are cross-referenced with existing project materials for context
4. Source metadata is tracked with addition date and reason for inclusion
5. Duplicate source detection prevents redundant analysis within projects

### Integration Verification

**IV1**: Source addition doesn't disrupt existing project analyses or organization
**IV2**: Existing reference tracking mechanisms remain functional for legacy workflows
**IV3**: Analysis quality remains consistent regardless of when sources are added to project

## Story 1.5: Cross-Project Reference and Analysis Discovery

As a research journalist,
I want to search and reference analysis outputs across my project collection,
so that I can identify patterns, contradictions, and connections between different investigations.

### Acceptance Criteria

1. `project-search` task finds content across all projects based on keywords or topics
2. Search results provide project context and file location for easy navigation
3. Cross-project analysis comparison identifies common themes and contradictory findings
4. Reference linking enables citation of findings from one project in another
5. Search maintains project boundaries while enabling discovery connections

### Integration Verification

**IV1**: Cross-project search doesn't compromise individual project data integrity
**IV2**: Search operations don't impact performance of active project workflows
**IV3**: Reference linking maintains existing citation and source verification standards

## Story 1.6: Project Lifecycle and Archive Management

As a research journalist,
I want to archive completed projects and manage project lifecycle states,
so that I can maintain an organized workspace while preserving completed research for future reference.

### Acceptance Criteria

1. `project-archive` task moves completed projects to archive location while maintaining accessibility
2. `project-restore` task brings archived projects back to active workspace
3. Project status progression (active → review → completed → archived) is tracked and manageable
4. Archived projects remain searchable but don't clutter active project listings
5. Archive operations preserve all analysis outputs and source materials

### Integration Verification

**IV1**: Archive operations don't affect active project performance or functionality
**IV2**: Restored projects maintain all functionality and integration capabilities
**IV3**: Project lifecycle management doesn't interfere with existing expansion pack operations