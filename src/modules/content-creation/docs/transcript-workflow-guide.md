# YouTube Transcript Workflow Guide

This guide provides detailed instructions for using the transcript saving system with the BMAD Content Creation module, including specific examples with debate and analysis videos.

## Quick Start

### 1. Access the Content Creation Module

Load the Content Creation module or activate the Producer agent as your entry point.

### 2. Use Save Transcript Task

The `save-transcript` task enables you to download and save YouTube video transcripts with rich metadata for analysis.

**Available through:**

- Direct task invocation: `save-transcript`
- Via Producer agent workflow menus
- As part of research and analysis workflows

### 3. Provide Video Information

The system will prompt you for:

- **YouTube URL**: Paste your video link
- **Participants**: Names will be auto-detected when possible
- **Series context**: Whether this relates to other content
- **Content type**: Debate, educational, interview, etc.

## Example Use Cases

### Example 1: Debate Analysis

**URL**: `https://youtu.be/U00-5cFfsj8`

- **Content Type**: Debate format (informal podcast-style)
- **Analysis Routing**: → `argument-analyst` for logical structure analysis
- **Saved As**: `references/transcripts/YYYY-MM-DD_U00-5cFfsj8_debate-on-democracy.md`

**Analysis Workflow:**

1. Save transcript using `save-transcript` task
2. Use `analyze-and-respond` workflow for comprehensive analysis
3. Apply `argument-analyst` agent for logical structure evaluation
4. Use `fact-checker` for claim verification

### Example 2: Structured Debate

**URL**: `https://youtu.be/tAO3C470yfg`

- **Content Type**: Debate format (structured format)
- **Analysis Routing**: → `argument-analyst` for argument structure analysis
- **Saved As**: `references/transcripts/YYYY-MM-DD_tAO3C470yfg_structured-debate.md`

**Analysis Workflow:**

1. Save transcript with debate classification
2. Use `argument-analyst` to map argument structure
3. Apply `integrity-analyst` for content integrity assessment
4. Use `fallacy-detective` for logical fallacy identification

### Example 3: Educational Content

**URL**: `https://youtu.be/example123`

- **Content Type**: Educational/Interview format
- **Analysis Routing**: → `subject-analyst` for insight extraction
- **Saved As**: `references/transcripts/YYYY-MM-DD_example123_educational-interview.md`

**Analysis Workflow:**

1. Save transcript with educational classification
2. Use `subject-analyst` for key insight extraction
3. Apply relevant analysis agents based on content focus
4. Extract references and source materials

## Content Type Classification System

### Debate Content

**Characteristics:**

- Multiple participants with opposing viewpoints
- Structured or semi-structured argumentation
- Focus on persuasion and logical reasoning
- Formal or informal debate format

**Recommended Agents:**

- **argument-analyst**: Logical structure analysis
- **fallacy-detective**: Logical fallacy identification
- **integrity-analyst**: Content integrity assessment
- **fact-checker**: Claim verification

**Analysis Approach:**

- Substantive analysis over performance evaluation
- Argument structure mapping
- Logical fallacy identification
- Integrity assessment
- Debate structure pattern recognition

### Educational Content

**Characteristics:**

- Single speaker or interview format
- Information sharing or teaching focus
- Documentary or news reporting
- Unstructured conversation

**Recommended Agents:**

- **subject-analyst**: Insight extraction and analysis
- **fact-checker**: Fact verification
- **archival-researcher**: Historical context
- **integrity-analyst**: Content credibility assessment

**Analysis Approach:**

- Key insight extraction
- Fact verification and source validation
- Historical context development
- Practical recommendations identification

### Interview/Discussion Content

**Characteristics:**

- Conversational format
- Expert interviews or panel discussions
- Topic exploration without debate structure
- Information gathering focus

**Recommended Agents:**

- **subject-analyst**: Subject matter analysis
- **archival-researcher**: Background research
- **fact-checker**: Claim verification

## Workflow Integration

### Research Article Workflow

1. **Research Planning**: Define investigation scope and goals
2. **Source Preparation**: Save transcripts with content classification
3. **Context Research**: Historical background using `archival-researcher`
4. **Content Analysis**: Route to appropriate agents based on classification
   - Debate → `argument-analyst` for argument analysis
   - Educational → `subject-analyst` for insight extraction
5. **Fact Verification**: Multi-source verification using `fact-checker`
6. **Article Creation**: Synthesize findings into article format

**Invoke via:** `research-article` workflow

### Analyze and Respond Workflow

1. **Source Preparation**: Save transcripts of content being analyzed
2. **Subject Analysis**: Analyze original authors/participants using `subject-analyst`
3. **Content Analysis**: Apply appropriate analytical agents
4. **Fact Verification**: Verify claims using `fact-checker`
5. **Response Creation**: Structured response with evidence

**Invoke via:** `analyze-and-respond` workflow

### Video Assets Creation Workflow

1. **Source Gathering**: Save transcripts of reference materials
2. **Script Development**: Use `screenwriter` for video script creation
3. **Content Optimization**: Apply `audience-engagement-manager` strategies
4. **Platform Adaptation**: Use `distribution-manager` for platform optimization

**Invoke via:** `create-video-assets` workflow

## Context Efficiency Benefits

### Local Storage System

- **Location**: `references/transcripts/YYYY-MM-DD_video-id_title-slug.md`
- **Metadata**: Video details, participants, content type, transcript quality
- **Reusability**: Same transcript can be used across multiple analysis sessions
- **Context Preservation**: Agents load only needed sections, not full transcript

### File Structure Example

```markdown
# Video Transcript: Democracy Debate

## Metadata

- **URL**: https://youtu.be/U00-5cFfsj8
- **Video ID**: U00-5cFfsj8
- **Title**: Democracy Debate
- **Duration**: 2:15:30
- **Content Type**: debate
- **Participants**: Speaker A, Speaker B
- **Transcript Source**: auto-generated
- **Downloaded**: 2025-11-12

## Transcript

[Full transcript content with timing markers]
```

## Project-Aware Transcript Management

### Using with Project Context

The transcript workflow integrates with project management features:

1. **Set Project Context**: Use `project-switch` to set active project
2. **Save Transcript**: Automatically saves to active project's references
3. **Organization**: Transcripts organized by project for easy retrieval
4. **Cross-Project**: Same transcript can be referenced across multiple projects

### Example Project Workflow

```
Step 1: Create/Switch to Project
- Use project-init or project-switch
- Set context for your research project

Step 2: Save Transcripts
- Use save-transcript task
- Automatically saved to project/references/transcripts/

Step 3: Analyze Content
- Use appropriate workflow (research-article, analyze-and-respond)
- Analysis outputs saved to project/analyses/

Step 4: Track Progress
- Use project-status to see transcript inventory
- Search across transcripts using project-search
```

## Team-Based Analysis Approaches

### Full Team Approach (Recommended)

**Best For**: Comprehensive analysis requiring multiple perspectives

**Process:**

1. Load full content creation team
2. Use Producer agent as coordination point
3. Save transcripts and classify content type
4. Route to appropriate specialized agents
5. Coordinate multi-agent analysis workflows

### Focused Agent Approach

**Best For**: Quick analysis or specific expertise needs

**Process:**

1. Save transcript using save-transcript task
2. Directly activate specific analysis agents
3. Manual coordination of insights
4. Faster for single-purpose analysis

## Advanced Usage Patterns

### Series Analysis

When analyzing multiple related videos:

1. Save all transcripts in batch
2. Use project management to organize series
3. Apply systematic analysis across all videos
4. Use `argument-analyst` to track argument evolution
5. Apply `fact-checker` for cross-video claim verification

### Comparative Analysis

For comparing debate performance or argument quality:

1. Save transcripts from different sources/debates
2. Use `argument-analyst` to compare argument structures
3. Apply systematic evaluation checklists
4. Generate comparative analysis reports

### Research Integration

Incorporating video analysis into larger research projects:

1. Use within `research-article` workflow
2. Combine with primary source research via `archival-researcher`
3. Apply `integrity-analyst` for content integrity assessment
4. Integrate findings into comprehensive research outputs

## Troubleshooting

### Transcript Quality Issues

- **Auto-generated errors**: Note in classification, may require manual review
- **Missing speakers**: Add participant names manually when prompted
- **Poor audio quality**: Document in transcript quality assessment
- **Language issues**: Specify language if non-English content

### Routing and Classification

- **Unclear content type**: Default to debate if political/argumentative discussion
- **Mixed format**: Route segments separately based on structure
- **Educational debates**: Academic debates may use educational analysis approach

### Context Efficiency

- **Large transcripts**: System automatically saves to file, returns metadata only
- **Multiple sessions**: Reuse saved transcripts without re-downloading
- **Agent switching**: Load transcript sections as needed, not full content
- **Project organization**: Use project management for transcript organization

## Next Steps

After saving and analyzing transcripts:

1. **For Research**: Continue with `fact-checker` for claim verification
2. **For Response**: Use `editor` to craft response maintaining your voice
3. **For Content**: Use `screenwriter` to create derivative video content
4. **For Analysis**: Generate structured reports using available templates
5. **For Publication**: Use `publish-article` or `publish-video` workflows

## Available Agents for Transcript Analysis

### Analysis Agents

- **argument-analyst**: Logical structure and argument analysis
- **fallacy-detective**: Logical fallacy detection
- **integrity-analyst**: Content integrity and credibility
- **subject-analyst**: Subject matter and insight extraction
- **fact-checker**: Multi-source fact verification

### Research Agents

- **archival-researcher**: Historical context and background
- **subject-analyst**: People and organization analysis

### Content Creation Agents

- **screenwriter**: Video script creation from transcripts
- **editor**: Content refinement and style consistency
- **style-analyst**: Writing style analysis

This transcript workflow system enables efficient research while maintaining context window efficiency and supporting both individual analysis and comprehensive research projects within the BMAD Content Creation module.
