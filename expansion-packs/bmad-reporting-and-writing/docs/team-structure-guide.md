# Team Structure Guide

This guide explains the team-based architecture of the bmad-reporting-and-writing expansion pack and how to use different team configurations for various research and content creation scenarios.

## Overview

The expansion pack is organized into specialized teams that can be used independently or together, following the bmad-core pattern of modular agent teams:

- **Research Team** (Current) - Complete research analysis capabilities
- **Production Team** (Planned) - Video and content production optimization
- **Writing Team** (Planned) - Content creation and editorial services
- **Full Team** - All agents from all specialized teams

## Research Team (Current)

### Team Composition
**8 Agents**: `research-strategist`, `subject-analyst`, `context-researcher`, `fact-checker`, `content-analyst`, `argument-analyst`, `debate-analyst`

### Core Capabilities

#### Research Planning & Strategy
- **research-strategist**: Investigation methodology, source strategy, research questions
- **context-researcher**: Historical background, timeline development, stakeholder mapping

#### Analysis & Verification
- **subject-analyst**: People/organization credibility assessment, motivation analysis
- **fact-checker**: Multi-source verification, Carter integrity framework application
- **content-analyst**: General content analysis, wisdom distillation, transcript saving
- **argument-analyst**: Logical structure analysis, fallacy identification
- **debate-analyst**: Substantive debate analysis, argument structure mapping

#### Content Type Routing
- **Debate Content** → `debate-analyst` for substantive argument analysis
- **Educational Content** → `content-analyst` + `distill-wisdom` for insight extraction
- **Claims Verification** → `fact-checker` for multi-source confirmation
- **People Analysis** → `subject-analyst` for credibility assessment

### When to Use Research Team
**Ideal For:**
- Investigative journalism projects
- Fact-checking and claim verification
- YouTube video analysis (debate or educational)
- Response journalism and analysis
- Background research and context development

**Load Command:**
```bash
bmad load team research-team
```

### Research Team Workflows
- **article-research-to-publish** - Complete research to publication pipeline
- **response-journalism** - Systematic analysis and response to published content

## Production Team (Planned)

### Planned Team Composition
**3 Agents**: `script-writer`, `platform-specialist`, `audience-optimizer`

### Planned Capabilities

#### Content Creation
- **script-writer**: Video scripts, social media content, engaging narratives
- **platform-specialist**: Algorithm optimization, platform-specific formatting
- **audience-optimizer**: Engagement strategies, retention optimization, viral potential

#### Platform Optimization
- YouTube algorithm optimization and video script creation
- Social media content optimization across multiple platforms
- Audience engagement and retention strategy development

### Planned Use Cases
- YouTube video production from research insights
- Social media content series development
- Platform-specific content adaptation
- Algorithm-optimized script creation

### Planned Workflows
- **youtube-video-production** - Research to optimized video script
- **social-media-content-series** - Coordinated multi-platform campaigns

## Writing Team (Planned)

### Planned Team Composition
**3 Agents**: `content-strategist`, `style-analyst`, `style-editor`

### Planned Capabilities

#### Editorial Services
- **content-strategist**: Content planning, series development, distribution strategy
- **style-analyst**: Writing style analysis, voice pattern extraction
- **style-editor**: Voice consistency, style refinement, final polish

#### Content Strategy
- Multi-format content planning and series development
- Voice and style consistency across content types
- Editorial refinement and final content polish

### Planned Use Cases
- Long-form article creation from research
- Content series planning and development
- Style consistency maintenance across projects
- Editorial services for research-driven content

### Planned Workflows
- Enhanced **article-research-to-publish** with editorial refinement
- **content-series-planning** workflow for systematic content development

## Full Team

### Team Composition
**14 Agents**: All agents from research, production, and writing teams plus `bmad-orchestrator`

### When to Use Full Team
**Ideal For:**
- Complex projects requiring research, production, and editorial capabilities
- Complete content creation pipelines from research to publication
- Multi-format content development (articles, videos, social media)
- Large-scale content strategy implementation

**Load Command:**
```bash
bmad load team full-team
```

### Full Team Workflows
All available workflows with complete agent coverage for comprehensive content creation.

## Team Selection Guide

### Choose Research Team When:
- **Primary Goal**: Investigation, analysis, fact-checking
- **Content Types**: YouTube analysis, claim verification, background research
- **Workflow Needs**: Research-focused with analysis outputs
- **Team Size**: Focused expertise without content production overhead

### Choose Production Team When (Future):
- **Primary Goal**: Content optimization for platforms
- **Content Types**: Video scripts, social media content
- **Workflow Needs**: Platform-specific optimization and audience engagement
- **Team Size**: Lean production-focused team

### Choose Writing Team When (Future):
- **Primary Goal**: Editorial and content strategy
- **Content Types**: Articles, content series, editorial refinement
- **Workflow Needs**: Style consistency and content planning
- **Team Size**: Editorial-focused without research or production overhead

### Choose Full Team When:
- **Primary Goal**: Complete content creation pipeline
- **Content Types**: All formats from research to final publication
- **Workflow Needs**: Research → Production → Editorial → Publication
- **Team Size**: Comprehensive coverage with all capabilities

## Agent Coordination Patterns

### Sequential Coordination
**Research → Analysis → Production/Editorial**
1. Research strategist plans investigation
2. Context researcher and subject analyst gather background
3. Content analyst saves transcripts and classifies content
4. Debate analyst or argument analyst performs specialized analysis
5. Fact checker verifies claims
6. Production/writing teams create final content

### Parallel Coordination
**Multiple Analysis Tracks**
- Subject analyst examines people/organizations
- Context researcher develops historical background
- Content analyst processes video/text sources
- Argument analyst evaluates logical structure
- All feed into fact checker for verification

### Iterative Coordination
**Research → Draft → Refine → Publish**
1. Research team develops comprehensive analysis
2. Writing team creates initial content draft
3. Production team optimizes for target platforms
4. Fact checker performs final verification
5. Style editor applies final polish

## Workflow Integration Strategies

### Research-First Approach
1. Use research team to develop comprehensive analysis
2. Save findings and verified facts
3. Switch to production or writing teams for content creation
4. Maintain research context throughout production

### Integrated Approach
1. Load full team for comprehensive coverage
2. Coordinate agents based on project phases
3. Maintain continuity across research, production, and editorial
4. Leverage specialized expertise within unified workflow

### Modular Approach
1. Use specialized teams for specific project phases
2. Hand off deliverables between teams
3. Optimize context usage by loading only needed agents
4. Scale team composition based on project complexity

## Context Efficiency Considerations

### Team Size vs. Context Usage
- **Research Team**: 8 agents - optimal for analysis-focused work
- **Production Team**: 3 agents - lean for content optimization
- **Writing Team**: 3 agents - focused on editorial services
- **Full Team**: 14 agents - comprehensive but higher context usage

### Workflow Efficiency
- Start with research team for investigation and analysis
- Add production/writing agents as needed for content creation
- Use transcript saving system to maintain context efficiency
- Coordinate handoffs between teams to preserve findings

This team structure provides flexible, scalable AI assistance that can grow with your content creation needs while maintaining efficiency and specialization.
