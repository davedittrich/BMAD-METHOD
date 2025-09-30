# project-switch

## Task Overview

Switch between project contexts to maintain focus on specific research investigations while enabling automatic project-aware routing in enhanced tasks across workflow sessions.

## Instructions

1. **Context Validation**
   - Verify the specified project exists using project-list functionality
   - Check project directory structure and metadata integrity
   - Validate project configuration file accessibility

2. **Context Switching Operations**
   - **Activate Project Context**: Set specified project as active context
   - **Deactivate Context**: Return to global mode with no active project
   - **Switch Projects**: Change from current active project to different project
   - **Display Current Context**: Show currently active project information

3. **Context Persistence**
   - Store active project context in `config/active-project.json` for session persistence
   - Include context metadata: project name, activation timestamp, session information
   - Ensure context survives CLI restarts and workflow session changes

4. **Integration with Enhanced Tasks**
   - Active project context automatically applies to Story 1.2 enhanced tasks
   - Enhanced tasks (analyze-video-content, distill-wisdom, save-transcript) use active context when no explicit project parameter provided
   - Context switching immediately affects subsequent task execution routing

5. **Feedback and Validation**
   - Provide clear confirmation of context switching success
   - Display current context status and project information
   - Show helpful guidance on using project context across workflows
   - Handle graceful fallback when active project becomes unavailable

## Elicitation Requirements

elicit: true
format: |
Please specify:

**Context Operation:**

- What would you like to do?
  - Activate project context (set a project as active)
  - Deactivate context (return to global mode)
  - Switch projects (change active project)
  - Show current context status

**Project Selection (if activating/switching):**

- Which project should be set as active? (Must match an existing project from project-list)
- Should this context persist across future workflow sessions?

**Context Preferences:**

- Any specific workflow focus or research phase to optimize guidance for?
- Should project-aware recommendations be included in task outputs?

## Output Requirements

**Context Activation Success:**

- Confirmation of project context activation
- Display active project name, description, and basic metrics
- Show project directory locations (references, analyses, drafts)
- Provide guidance on how project context affects enhanced tasks

**Context Status Display:**

- Current active project (or "No active project" if global mode)
- Context activation timestamp and session information
- Project progress summary and recent activity
- Next suggested research actions based on project state

**Context Persistence:**

- Store context state in `config/active-project.json` with format:

```json
{
  "active_project": "project-name",
  "context_set_date": "2025-01-09T14:30:00Z",
  "session_id": "session-identifier",
  "last_accessed": "2025-01-09T14:30:00Z",
  "context_source": "manual"
}
```

**Integration Guidance:**

- Explain how active context affects analyze-video-content, distill-wisdom, and save-transcript tasks
- Provide examples of project-aware routing behavior
- Show how to override context with explicit project parameters if needed

**Error Handling:**

- Clear messages for invalid project names or missing projects
- Guidance for resolving context conflicts or corrupted project data
- Fallback instructions when project context becomes unavailable

**Context Efficiency:**

- Context switching operations complete in <2 seconds
- Minimal impact on subsequent task execution performance
- Automatic cleanup of invalid or deleted project contexts
