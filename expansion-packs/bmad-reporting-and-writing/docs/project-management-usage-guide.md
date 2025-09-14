# BMAD Reporting & Writing Project Management System - Usage Guide

## Quick Start Reference

### Essential Task Commands

```
project-init                    # Create new research project
project-switch                  # Change active project context
project-status                  # View current project details
project-list                    # List all projects
project-rename                  # Rename existing project
project-add-source              # Add source materials to project
project-search                  # Search across projects and sources
project-link                    # Create project relationships
project-insights                # Analyze patterns across projects
project-collaborate             # Set up team collaboration
project-archive                 # Archive completed projects
project-restore                 # Restore archived projects
```

### Core Analysis Tasks (Now Project-Aware)

```
analyze-video-content           # Enhanced with optional project context
distill-wisdom                 # Enhanced with optional project context
save-transcript                 # Enhanced with optional project context
```

## Common Workflows

### 1. Starting a New Research Project

**Quick Setup**:

```
1. project-init
   → Enter project name (e.g., "climate-investigation-2025")
   → Add description and tags
   → Project structure created automatically

2. project-switch
   → Select your new project as active context

3. Begin research with any analysis task
   → Tasks automatically save to active project
```

**Project Structure Created**:

```
projects/climate-investigation-2025/
├── references/          # Source materials (transcripts, documents)
├── analyses/           # Your analysis outputs
├── drafts/             # Work-in-progress content
└── config/            # Project metadata and settings
```

### 2. Daily Research Workflow

**Recommended Pattern**:

```
1. project-switch        # Set context for today's focus
2. project-status        # Review current project state
3. save-transcript       # Add new video sources
4. analyze-video-content # Generate analysis
5. project-status        # See updated progress
```

**Context Benefits**:

- No need to specify project for each task
- All outputs automatically organized
- Clear progress tracking
- Easy switching between projects

### 3. Managing Multiple Projects

**Best Practices**:

```
Morning Routine:
1. project-list          # See all active projects
2. project-switch        # Choose today's focus
3. project-status        # Review where you left off

Project Switching:
1. Save current work
2. project-switch        # Change to different project
3. project-status        # Get oriented in new context
4. Continue research

Weekly Review:
1. project-list          # Review all projects
2. For each project: project-status
3. Plan next week's priorities
```

### 4. Project Organization and Maintenance

**Renaming Projects**:

```
When to Rename:
- Research scope evolved beyond original name
- Initial working title needs professional refinement
- Better descriptive name improves organization
- Team collaboration requires clearer naming

Rename Process:
1. project-rename
   → Enter current project name
   → Provide new name (lowercase, hyphens only)
   → Confirm operation with backup option
   → All data and relationships preserved

Safety Features:
- Automatic backup before rename
- Atomic operation (all-or-nothing)
- Cross-project references updated automatically
- Active project context preserved
- Rollback capability if issues occur
```

**Best Practices**:

- Use descriptive names that explain the investigation focus
- Keep names concise but informative (e.g., "climate-policy-analysis-2025")
- Avoid changing names frequently to maintain consistency
- Consider team members when renaming collaborative projects
- Update any external documentation referencing the old name

### 5. Source Management

**Adding Sources**:

```
Manual Addition:
1. project-add-source
   → Provide URL or local path
   → Add title and description
   → Source automatically organized

Via Analysis Tasks:
1. save-transcript [URL]
   → Transcript saved to current project
   → Source metadata tracked automatically
```

**Finding Sources**:

```
Within Project:
- project-status shows recent sources
- Browse projects/{name}/references/

Across Projects:
1. project-search
   → Enter search terms
   → Results show source location and project
```

**Source Deduplication**:

- Same source added to multiple projects = one copy stored
- System tracks which projects reference each source
- Updates available across all projects automatically

### 6. Cross-Project Research

**Creating Relationships**:

```
1. project-link
   → Select source project
   → Select target project
   → Choose relationship type:
     * dependency: One builds on another
     * reference: Shared research themes
     * collaboration: Shared team members
     * succession: Follow-up investigations
   → Add purpose description
```

**Analyzing Patterns**:

```
1. project-insights
   → Analyzes patterns across related projects
   → Identifies trends and research evolution
   → Suggests meta-analysis opportunities
   → Highlights collaborative opportunities
```

### 7. Team Collaboration

**Setting Up Collaboration**:

```
1. project-collaborate
   → Define team members and roles
   → Set up shared annotation system
   → Configure coordination workflows
   → Establish communication patterns
```

**Collaboration Features**:

- Shared resource management
- Team coordination workflows
- Collaborative annotation systems
- Multi-researcher support

### 8. Project Lifecycle Management

**Lifecycle Progression**:

```
Active (default)
↓
Review (research complete, under validation)
↓
Completed (objectives met, documented)
↓
Archived (long-term storage)
```

**Managing Transitions**:

```
Moving to Review:
- Complete research objectives
- Organize all materials
- Update project status

Moving to Completed:
- Validate findings
- Complete documentation
- Finalize deliverables

Moving to Archived:
1. project-archive
   → Moves to archive storage
   → Remains searchable
   → Frees active workspace
```

**Archive Management**:

```
Restore Archived Project:
1. project-restore
   → Select from archive list
   → Choose restoration location
   → Validate complete restoration

Archive Search:
- project-search includes archived projects
- Filter by active/archived status
- Full content search across archive
```

## Advanced Patterns

### Research Portfolio Management

**Organizing Large Research Programs**:

```
1. Create main investigation project
2. Create sub-projects for specific aspects
3. Link projects with dependency relationships
4. Use project-insights for meta-analysis
5. Coordinate team efforts with project-collaborate
```

**Example Structure**:

```
climate-change-main          (Main investigation)
├── linked to: climate-policy-analysis
├── linked to: renewable-energy-study
├── linked to: carbon-markets-research
└── linked to: international-agreements
```

### Iterative Research Development

**Expanding Research Scope**:

```
1. Start with narrow focus project
2. Add sources as questions emerge
3. Create related projects for new angles
4. Link projects to maintain relationships
5. Use cross-project search for discovery
```

**Source Evolution**:

```
Week 1: Basic video analysis
Week 2: Add supporting documents
Week 3: Expert interviews
Week 4: Counter-perspective sources
Week 5: Historical context materials
```

### Quality Assurance Workflows

**Regular Review Process**:

```
Daily:
- project-status for progress check
- Verify all sources properly tagged

Weekly:
- project-list for portfolio overview
- Review cross-project relationships
- Clean up and organize materials

Monthly:
- Archive completed projects
- Review and update project relationships
- Analyze research patterns with project-insights
```

## Troubleshooting

### Common Issues and Solutions

**"I can't find my analysis outputs"**

- Check active project context with project-status
- Use project-search to search across all projects
- Verify project was active when analysis was run

**"Project switching isn't working"**

- Ensure project exists with project-list
- Check project names for typos
- Verify project hasn't been archived

**"Sources appear in multiple projects"**

- This is normal! Source deduplication saves storage
- Same source can be referenced by multiple projects
- Check project-status to see project-specific references

**"Cross-project relationships are confusing"**

- Start simple with one or two relationships
- Use project-insights to see relationship maps
- Focus on clear dependency or reference relationships

**"Archive/restore operations failing"**

- Check available disk space
- Verify project status allows archival
- Check for cross-project relationship conflicts

### Performance Optimization

**For Large Research Portfolios**:

```
- Archive completed projects regularly
- Use specific project context instead of global search
- Organize projects by time period or theme
- Regular cleanup of test/temporary projects
```

**For Team Collaboration**:

```
- Establish clear project naming conventions
- Define relationship types consistently
- Regular synchronization of shared resources
- Clear role definitions in collaboration setup
```

## Migration from Previous Workflows

### Adopting Project Management Gradually

**Phase 1: Basic Projects (Week 1)**

```
1. Create project for current research
2. Start using project context for new analysis
3. Continue existing workflows otherwise
```

**Phase 2: Organization (Week 2-3)**

```
1. Organize existing materials into projects
2. Practice project switching
3. Experiment with source management
```

**Phase 3: Advanced Features (Week 4+)**

```
1. Create project relationships
2. Explore cross-project insights
3. Set up collaboration features
4. Practice lifecycle management
```

### Organizing Existing Materials

**Retroactive Organization**:

```
1. Identify main research themes in existing work
2. Create projects for each major theme
3. Manually move materials to appropriate projects
4. Use project-add-source for external references
5. Create relationships between related projects
```

## Best Practices

### Project Naming Conventions

```
Good Examples:
- climate-policy-investigation-2025
- renewable-energy-transition-study
- carbon-markets-analysis

Avoid:
- project1, project2 (non-descriptive)
- very-long-project-names-that-are-hard-to-remember
- special-characters-!@#$%
```

### Research Organization Tips

```
- One project per major research question
- Use clear, descriptive project names
- Add comprehensive descriptions and tags
- Regular status reviews and cleanup
- Archive completed work promptly
```

### Team Collaboration Guidelines

```
- Establish clear naming conventions
- Define role responsibilities upfront
- Regular synchronization meetings
- Clear communication about relationship changes
- Shared understanding of lifecycle management
```

### Source Management Efficiency

```
- Add descriptive titles when adding sources
- Use tags consistently across projects
- Regular cleanup of outdated sources
- Leverage deduplication for efficiency
- Maintain clear source organization
```

## Advanced Configuration

### Customizing Project Templates

Projects use JSON configuration files that can be customized:

**Project Metadata Template**:

```json
{
  "name": "project-name",
  "description": "project description",
  "created_date": "ISO-8601-timestamp",
  "status": "active",
  "tags": ["tag1", "tag2"],
  "lifecycle_history": [],
  "relationships": [],
  "collaboration": {}
}
```

**Archive Metadata Template**:

```json
{
  "archive_date": "ISO-8601-timestamp",
  "archive_reason": "completion description",
  "original_location": "projects/project-name",
  "archive_status": "healthy",
  "restoration_count": 0,
  "preserve_relationships": true
}
```

## Getting Help

### Built-in Help

```
- Use *help command in BMAD system
- Each task includes detailed instructions
- Error messages provide specific guidance
```

### Documentation Resources

```
- User Training Guide: Complete learning modules
- Story Documentation: Technical implementation details
- Task Files: Comprehensive usage instructions
```

### Support and Feedback

```
- Report issues through BMAD framework support
- Share experiences with other researchers
- Contribute to best practices documentation
```

## Summary

The BMAD Reporting & Writing Project Management System transforms research from a linear process into an organized, scalable, and collaborative workflow. Key benefits include:

✅ **Automatic Organization**: Research materials organized by project  
✅ **Context-Aware Workflows**: Seamless project switching and context preservation  
✅ **Intelligent Source Management**: Deduplication and cross-project discovery  
✅ **Collaborative Research**: Team coordination and shared resources  
✅ **Lifecycle Management**: Complete project progression with archival capabilities  
✅ **Cross-Project Intelligence**: Pattern recognition and relationship insights

Start with basic project creation and gradually adopt advanced features as they become natural to your workflow. The system is designed to enhance productivity while maintaining the simplicity and flexibility that makes BMAD Reporting & Writing expansion pack effective.
