# YouTube Transcript Workflow Guide

This guide provides detailed instructions for using the transcript saving system with the bmad-reporting-and-writing research team, including specific examples with Curtis Yarvin debate videos.

## Quick Start

### 1. Load the Research Team

```bash
bmad load team research-team
```

### 2. Activate Content Analyst

```bash
bmad activate content-analyst
```

### 3. Save Transcript

```bash
*save-transcript
```

The content-analyst will prompt you for:

- **YouTube URL**: Paste your video link
- **Participants**: Names will be auto-detected when possible
- **Series context**: Whether this relates to other content

## Your Curtis Yarvin Debate Examples

### Example 1: Curtis Yarvin vs. Ben Burgis on Democracy

**URL**: `https://youtu.be/U00-5cFfsj8`

- **Expected Classification**: Debate format (informal podcast-style)
- **Routing**: → `debate-analyst` for substantive argument analysis
- **Saved As**: `references/transcripts/YYYY-MM-DD_U00-5cFfsj8_yarvin-burgis-democracy.md`

### Example 2: Curtis Yarvin vs. Ilya Shapiro

**URL**: `https://youtu.be/tAO3C470yfg`

- **Expected Classification**: Debate format (structured Austin Union format)
- **Routing**: → `debate-analyst` for argument structure analysis
- **Saved As**: `references/transcripts/YYYY-MM-DD_tAO3C470yfg_yarvin-shapiro-debate.md`

### Example 3: Curtis Yarvin vs. E. Glen Weyl

**URL**: `https://youtu.be/irc6creOFGs`

- **Expected Classification**: Debate format (Open to Debate format)
- **Routing**: → `debate-analyst` for formal debate analysis
- **Saved As**: `references/transcripts/YYYY-MM-DD_irc6creOFGs_yarvin-weyl-debate.md`

## Content Type Classification System

### Debate Content → debate-analyst

**Characteristics:**

- Multiple participants with opposing viewpoints
- Structured or semi-structured argumentation
- Focus on persuasion and logical reasoning
- Formal or informal debate format

**Analysis Approach:**

- Substantive analysis over performance evaluation
- Argument structure mapping using Damer's five criteria
- Logical fallacy identification
- Integrity assessment using Carter framework
- Debate structure pattern recognition

### Educational Content → content-analyst + distill-wisdom

**Characteristics:**

- Single speaker or interview format
- Information sharing or teaching focus
- Documentary or news reporting
- Unstructured conversation

**Analysis Approach:**

- Wisdom extraction (insights, quotes, habits, facts)
- Key takeaway identification
- Reference and source compilation
- Practical recommendations

## Workflow Integration

### Research Workflow (article-research-to-publish)

1. **Research Planning**: Research strategist creates investigation brief
2. **Source Preparation**: Transcript saving with content type classification
3. **Context Research**: Historical background and stakeholder analysis
4. **Content Analysis**: Routes to appropriate analyst based on classification
   - Debate → debate-analyst for argument analysis
   - Educational → content-analyst for wisdom distillation
5. **Fact Verification**: Multi-source verification and integrity analysis

### Response Journalism Workflow

1. **Source Preparation**: Save transcripts of content being analyzed
2. **Subject Analysis**: Analyze original authors/participants
3. **Content Analysis**: Route based on format classification
4. **Fact Verification**: Verify claims using multiple sources
5. **Response Creation**: Structured response with evidence

## Context Efficiency Benefits

### Local Storage System

- **Location**: `references/transcripts/YYYY-MM-DD_video-id_title-slug.md`
- **Metadata**: Video details, participants, content type, transcript quality
- **Reusability**: Same transcript can be used across multiple analysis sessions
- **Context Preservation**: Agents load only needed sections, not full transcript

### File Structure Example

```markdown
# Video Transcript: Curtis Yarvin vs. Ben Burgis Democracy Debate

## Metadata

- **URL**: https://youtu.be/U00-5cFfsj8
- **Video ID**: U00-5cFfsj8
- **Title**: Curtis Yarvin vs. Ben Burgis on Democracy
- **Duration**: 2:15:30
- **Content Type**: debate
- **Participants**: Curtis Yarvin, Ben Burgis
- **Transcript Source**: auto-generated
- **Downloaded**: 2025-09-05

## Transcript

[Full transcript content with timing markers]
```

## Team-Based vs. Individual Agent Approaches

### Research Team Approach (Recommended)

**Best For**: Comprehensive analysis requiring multiple perspectives
**Process**:

1. Research strategist coordinates investigation
2. Context researcher provides background
3. Content analyst saves transcripts and classifies
4. Debate analyst or content analyst performs specialized analysis
5. Fact checker verifies claims

### Individual Agent Approach

**Best For**: Quick analysis or specific expertise needs
**Process**:

1. Directly activate content-analyst for transcript saving
2. Switch to debate-analyst for debate analysis
3. Manual coordination of insights

## Advanced Usage Patterns

### Series Analysis

When analyzing multiple related debates:

1. Save all transcripts in batch using content-analyst
2. Use debate-analyst to analyze argument evolution across videos
3. Apply fact-checker for cross-video claim verification
4. Use context-researcher for participant background analysis

### Comparative Analysis

For comparing debate performance or argument quality:

1. Save transcripts from different debate formats
2. Use debate-analyst to compare argument structures
3. Apply argument-structure-checklist for systematic evaluation
4. Generate comparative analysis reports

### Research Integration

Incorporating debate analysis into larger research projects:

1. Use within article-research-to-publish workflow
2. Combine with primary source research via context-researcher
3. Apply integrity-analysis using Carter framework
4. Integrate findings into comprehensive research briefs

## Troubleshooting

### Transcript Quality Issues

- **Auto-generated errors**: Note in classification, may require manual review
- **Missing speakers**: Add participant names manually in elicitation
- **Poor audio quality**: Document in transcript quality assessment

### Routing Issues

- **Unclear content type**: Default to debate-analyst for political discussions
- **Mixed format**: Route segments separately based on structure
- **Educational debates**: Academic debates may route to educational analysis

### Context Efficiency

- **Large transcripts**: System automatically saves to file, returns metadata only
- **Multiple sessions**: Reuse saved transcripts without re-downloading
- **Agent switching**: Load transcript sections as needed, not full content

## Next Steps

After saving and analyzing transcripts:

1. **For Research**: Continue with fact-checker for claim verification
2. **For Response**: Use style-editor to craft response maintaining your voice
3. **For Content**: Use script-writer to create derivative content
4. **For Analysis**: Generate structured reports using available templates

This transcript workflow system enables efficient research while maintaining context window efficiency and supporting both individual analysis and comprehensive research projects.
