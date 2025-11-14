# Team Structure Guide

This guide explains the team-based architecture of the BMAD Content Creation module and how to use different team configurations for various research and content creation scenarios.

## Overview

The Content Creation module is organized into specialized teams that can be used independently or together, following the BMAD Core pattern of modular agent teams:

- **Full Team** (Current) - Complete content creation capabilities with all agents
- **Research Team** (In Development) - Focused research and analysis capabilities
- **Production Team** (In Development) - Video and content production optimization
- **Writing Team** (In Development) - Content creation and editorial services

## Available Agents

The Content Creation module includes 14 specialized agents:

### Research & Analysis Agents

- **archival-researcher**: Historical background, timeline development, context research
- **subject-analyst**: People/organization credibility assessment, motivation analysis
- **fact-checker**: Multi-source verification, integrity framework application
- **argument-analyst**: Logical structure analysis, fallacy identification
- **integrity-analyst**: Content integrity assessment and verification
- **fallacy-detective**: Specialized logical fallacy detection and analysis

### Content Creation Agents

- **producer**: Primary entry point for content creation workflows
- **screenwriter**: Video scripts, engaging narratives, storytelling
- **editor**: Content refinement, style consistency, final polish
- **style-analyst**: Writing style analysis, voice pattern extraction
- **style-guide**: Style guide creation and maintenance

### Distribution & Engagement Agents

- **audience-engagement-manager**: Engagement strategies, retention optimization
- **distribution-manager**: Platform-specific formatting and optimization
- **director**: Content orchestration and production management

## Full Team (Current)

### Team Composition

**11 Agents**: bmad-orchestrator, archival-researcher, subject-analyst, fact-checker, argument-analyst, audience-engagement-manager, screenwriter, distribution-manager, style-analyst, editor, plus supporting infrastructure agents

### Core Capabilities

#### Research & Verification

- Multi-source fact-checking and verification
- Subject credibility assessment
- Historical context and background research
- Logical argument analysis

#### Content Creation

- Video script writing and optimization
- Style analysis and consistency
- Editorial refinement and polish
- Content orchestration

#### Distribution & Optimization

- Platform-specific content adaptation
- Audience engagement optimization
- Multi-platform distribution strategy

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

The full team supports comprehensive workflows including:

- **research-article**: Complete research to article pipeline
- **create-video-assets**: Video script and asset creation
- **analyze-and-respond**: Systematic analysis and response journalism
- **adapt-for-social-media**: Multi-platform content adaptation
- **publish-article**: Article publication workflow
- **publish-video**: Video publication workflow
- **promote-content**: Content promotion and distribution

## Research Team (In Development)

### Planned Team Composition

Agents focused on investigation, analysis, and verification:

- **archival-researcher**: Historical context and background
- **subject-analyst**: People and organization analysis
- **fact-checker**: Multi-source verification
- **argument-analyst**: Logical structure analysis
- **integrity-analyst**: Content integrity assessment
- **fallacy-detective**: Fallacy detection and analysis

### Planned Capabilities

#### Research Planning & Strategy

- Investigation methodology and source strategy
- Historical background and timeline development
- Stakeholder mapping and context analysis

#### Analysis & Verification

- People/organization credibility assessment
- Multi-source fact verification
- Logical structure and argument analysis
- Integrity framework application

#### Content Type Routing

- **Debate Content** → argument-analyst for substantive analysis
- **Educational Content** → subject-analyst for insight extraction
- **Claims Verification** → fact-checker for multi-source confirmation
- **People Analysis** → subject-analyst for credibility assessment

### When to Use Research Team

**Ideal For:**

- Investigative journalism projects
- Fact-checking and claim verification
- YouTube video analysis (debate or educational)
- Response journalism and analysis
- Background research and context development

## Production Team (In Development)

### Planned Team Composition

Agents focused on content creation and optimization:

- **screenwriter**: Video scripts and engaging narratives
- **distribution-manager**: Platform-specific optimization
- **audience-engagement-manager**: Engagement and retention strategies
- **director**: Production orchestration

### Planned Capabilities

#### Content Creation

- Video script development and optimization
- Social media content creation
- Platform-specific formatting
- Engaging narrative development

#### Platform Optimization

- YouTube algorithm optimization
- Social media platform adaptation
- Audience engagement strategy
- Retention optimization

### Planned Use Cases

- YouTube video production from research insights
- Social media content series development
- Platform-specific content adaptation
- Algorithm-optimized script creation

## Writing Team (In Development)

### Planned Team Composition

Agents focused on editorial and writing services:

- **editor**: Content refinement and final polish
- **style-analyst**: Writing style analysis
- **style-guide**: Style guide management
- **producer**: Content workflow orchestration

### Planned Capabilities

#### Editorial Services

- Writing style analysis and voice extraction
- Style consistency across content types
- Editorial refinement and polish
- Content strategy and planning

#### Content Strategy

- Multi-format content planning
- Series development and coordination
- Voice consistency maintenance
- Editorial workflow management

### Planned Use Cases

- Long-form article creation from research
- Content series planning and development
- Style consistency maintenance across projects
- Editorial services for research-driven content

## Team Selection Guide

### Choose Full Team When:

- **Primary Goal**: Complete content creation pipeline
- **Content Types**: All formats from research to final publication
- **Workflow Needs**: Research → Production → Editorial → Publication
- **Team Size**: Comprehensive coverage with all capabilities

### Choose Research Team When (Future):

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

## Agent Coordination Patterns

### Sequential Coordination

**Research → Analysis → Production → Editorial**

1. Research planning and source gathering
2. Historical context and background development
3. Content analysis and transcript processing
4. Specialized analysis (debate, argument, integrity)
5. Fact verification and claim checking
6. Script creation and content development
7. Style analysis and editorial refinement
8. Platform optimization and distribution

### Parallel Coordination

**Multiple Analysis Tracks**

- Subject analyst examines people/organizations
- Archival researcher develops historical background
- Argument analyst evaluates logical structure
- Fact checker verifies claims and sources
- All feed into content creation pipeline

### Iterative Coordination

**Research → Draft → Refine → Publish**

1. Research team develops comprehensive analysis
2. Production team creates initial content draft
3. Writing team applies style and editorial polish
4. Fact checker performs final verification
5. Distribution manager optimizes for platforms

## Workflow Integration Strategies

### Research-First Approach

1. Use research-focused agents for comprehensive analysis
2. Save findings and verified facts
3. Transition to production agents for content creation
4. Maintain research context throughout production

### Integrated Approach

1. Load full team for comprehensive coverage
2. Coordinate agents based on project phases
3. Maintain continuity across research, production, and editorial
4. Leverage specialized expertise within unified workflow

### Modular Approach

1. Use specialized teams for specific project phases (when available)
2. Hand off deliverables between teams
3. Optimize context usage by loading only needed agents
4. Scale team composition based on project complexity

## Context Efficiency Considerations

### Team Size vs. Context Usage

- **Full Team**: 11+ agents - comprehensive but higher context usage
- **Research Team** (Future): ~6 agents - optimal for analysis-focused work
- **Production Team** (Future): ~4 agents - lean for content optimization
- **Writing Team** (Future): ~4 agents - focused on editorial services

### Workflow Efficiency

- Start with full team for comprehensive projects
- Use producer agent as primary entry point for workflows
- Leverage project management features to maintain context
- Coordinate handoffs between agent types to preserve findings

## Migration Status

**Current Status:**

- ✅ Full Team available and operational
- 🔄 Research Team in development
- 🔄 Production Team in development
- 🔄 Writing Team in development

This team structure provides flexible, scalable AI assistance that can grow with your content creation needs while maintaining efficiency and specialization.
