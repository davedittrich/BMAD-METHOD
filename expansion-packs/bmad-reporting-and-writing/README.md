# BMAD Reporting & Writing Expansion Pack

Transform your AI into a comprehensive reporting and content creation studio with specialized agents for journalism, research, and platform-optimized content.

## 📰 Overview

The Reporting & Writing Expansion Pack extends BMAD-Method with a comprehensive suite of social media and journalism-focused agents, workflows, and tools. Whether you're conducting investigative reporting, creating social media content, fact-checking claims, or responding to published work, this pack provides structured AI assistance throughout your research and writing process.

For a full list of available expansion packs, see the [Expansion Packs documentation](../../docs/expansion-packs.md).

### Key Features

- 🤖 **11 Specialized Agents** - From research strategy to platform optimization
- 📊 **4 Complete Workflows** - Article research, YouTube production, response journalism, social media series
- ✅ **4 Quality Checklists** - Source credibility, integrity assessment, KDP publishing, YouTube optimization
- 📝 **15 Research & Writing Tasks** - Structured activities for investigation and content creation
- 📋 **7 Professional Templates** - Research briefs, fact-check reports, video scripts, analysis templates

## 🔍 Included Agents

### Research Team

1.  **Research Strategist** - Develops a comprehensive plan for the investigation, including defining research questions, identifying potential sources, and establishing a methodology for data collection and analysis.
2.  **Context Researcher** - Gathers and analyzes historical data, creating timelines and mapping out the key stakeholders and their relationships to provide a deep understanding of the subject's background.
3.  **Subject Analyst** - Conducts in-depth analysis of individuals and organizations, assessing their credibility, motivations, and potential biases.
4.  **Fact Checker** - Verifies all claims and data points, using a rigorous, multi-source confirmation process to ensure the accuracy and integrity of the information, leveraging the Carter framework for integrity analysis.

### Content Creation Team

5.  **Content Strategist** - Plans and develops the content series, defining the narrative arc, target audience, and distribution strategy to maximize impact.
6.  **Script Writer** - Crafts compelling narratives for various formats, including video scripts, social media content, and long-form articles, ensuring the story is engaging and easy to understand.
7.  **Style Editor** - Refines the content to ensure a consistent voice and style, polishing the final product for clarity, flow, and impact.
8.  **Argument Analyst** - Analyzes the logical structure of arguments, identifying fallacies and ensuring that the reasoning is sound and well-supported by evidence.

### Optimization Team

9.  **Platform Specialist** - Optimizes content for specific platforms, such as YouTube or Twitter, using knowledge of algorithms and best practices to maximize reach and engagement.
10. **Audience Optimizer** - Focuses on strategies to increase audience engagement and retention, such as crafting compelling hooks and calls-to-action.
11. **Style Analyst** - Analyzes writing styles to extract patterns and create style guides, ensuring that the content aligns with the desired brand voice.

## 🚀 Installation

### Via BMAD Installer

```bash
npx bmad-method install
# Select "Reporting & Writing Pack" from the expansion packs list
```

### Manual Installation

1. Clone or download this expansion pack
2. Copy to your BMAD Method installation:
   ```bash
   cp -r bmad-reporting-and-writing/* ~/bmad-method/expansion-packs/bmad-reporting-and-writing/
   ```
3. Run the BMAD installer to register the pack

## 📖 Documentation

- [Transcript Workflow Guide](docs/transcript-workflow-guide.md) - YouTube transcript saving and content routing
- [Team Structure Guide](docs/team-structure-guide.md) - Research, production, and writing teams
- [Development Notes](docs/development-notes.md) - Technical implementation history

## 💡 Usage

### Quick Start

```bash
# Load the complete reporting & writing team
bmad load team reporting-writing

# Or activate individual agents
bmad activate research-strategist
bmad activate fact-checker
bmad activate script-writer
```

### Available Workflows

- **article-research-to-publish** - A comprehensive workflow that takes you from the initial research phase to a fully-vetted, publishable article. This workflow leverages the entire research team to ensure accuracy and depth, and then brings in the content creation team to craft a compelling narrative.
- **youtube-video-production** - This workflow is designed to create high-quality, algorithm-optimized YouTube videos. It starts with the research team to gather information, then moves to the script writer and style editor to create an engaging script, and finally uses the platform specialist to optimize for YouTube.
- **response-journalism** - This workflow provides a structured process for analyzing and responding to published content. It uses the fact-checker and argument analyst to deconstruct the original piece, and then the content creation team to craft a well-reasoned response.
- **social-media-content-series** - This workflow is designed to create a coordinated content series across multiple social media platforms. It uses the content strategist to plan the series, the script writer to create the content, and the platform specialist to optimize for each platform.

## 📋 Key Components

### Core Research & Analysis

- **Fact-Checking Framework** - Systematic verification using multiple independent sources
- **Carter Integrity Analysis** - Three-step integrity assessment (discernment, acknowledgment, consistency)
- **Source Credibility Assessment** - Comprehensive evaluation of source reliability and trustworthiness
- **Logical Fallacy Detection** - Systematic identification and analysis of reasoning flaws

### Content Creation & Optimization

- **Platform-Specific Optimization** - YouTube algorithm, social media engagement, SEO optimization
- **Multi-Format Scripts** - Long-form videos, YouTube Shorts, social media posts, article templates
- **Voice & Style Analysis** - Writing pattern recognition and consistency maintenance
- **Engagement Optimization** - Retention strategies, hook development, call-to-action optimization

### Templates

- `research-brief-tmpl.yaml` - Investigation planning and source strategy
- `fact-check-report-tmpl.yaml` - Systematic fact verification documentation
- `youtube-long-script-tmpl.yaml` - Full-length video script with optimization
- `youtube-short-script-tmpl.yaml` - Short-form content optimized for algorithm
- `source-verification-tmpl.yaml` - Credibility assessment template
- `integrity-analysis-tmpl.yaml` - Carter framework integrity evaluation
- `style-guide-tmpl.yaml` - Voice consistency and style documentation

### Quality Assurance Checklists

- **source-credibility-checklist.md** - Comprehensive source evaluation framework
- **integrity-assessment-checklist.md** - Carter integrity framework application
- **kdp-cover-ready-checklist.md** - Amazon KDP publishing requirements
- **youtube-video-ready-checklist.md** - Platform optimization and technical requirements

## 🎯 Use Cases

### Independent Journalism

- **Investigative Reporting** - Systematic research methodology with fact-checking
- **Source Verification** - Credibility assessment and reliability evaluation
- **Background Research** - Historical context and timeline development
- **Integrity Analysis** - Subject assessment using established ethical frameworks

### Content Creation

- **YouTube Video Production** - Algorithm-optimized scripts with engagement strategies
- **Social Media Content** - Platform-specific optimization and series planning
- **Response Articles** - Analytical responses to published content with fact-checking
- **Blog/Newsletter Content** - Research-driven articles with SEO optimization

### Fact-Checking & Analysis

- **Claim Verification** - Multi-source fact-checking methodology
- **Logical Analysis** - Argument structure evaluation and fallacy detection
- **Context Research** - Historical precedents and broader perspective analysis
- **Expert Consultation** - Systematic approach to expert source management

### Platform Optimization

- **Algorithm Optimization** - YouTube, social media platform-specific strategies
- **Engagement Maximization** - Retention hooks, interaction triggers, viral potential
- **Cross-Platform Distribution** - Consistent messaging across multiple channels
- **Performance Analytics** - Success metrics and optimization recommendations

## 📊 Research Methods & Standards

### Source Evaluation Framework

- Author expertise and qualifications assessment
- Publication standards and editorial oversight review
- Bias assessment and independence evaluation
- Evidence quality and verifiability analysis
- Cross-reference verification methodology

### Integrity Analysis (Carter Framework)

1. **Discernment**: Can subject distinguish right from wrong?
2. **Acknowledgment**: Does subject act according to their discernment?
3. **Action Consistency**: Can subject defend actions on moral grounds?

### Platform Best Practices

- **YouTube**: Algorithm optimization, retention strategies, engagement triggers
- **Social Media**: Platform-specific formatting, hashtag strategy, community building
- **Blog/Article**: SEO optimization, readability, citation standards
- **Newsletter**: Subscriber engagement, content series, distribution timing

## 🤝 Contributing

We welcome contributions! Please:

1. Fork the repository
2. Create a feature branch following reporting/journalism focus
3. Follow BMAD Method conventions for natural language framework
4. Maintain professional journalism standards
5. Submit a PR with clear description

## 📄 License

This expansion pack follows the same license as BMAD Method core.

## 🏆 Credits

Adapted by Dave Dittrich for the BMAD Method community from Wes's Creative Writing expansion pack using Claude Code and Gemini CLI.

Special thanks to Brian (BMAD) for creating the BMAD Method framework.

**Integrity Analysis Framework**: Based on Stephen L. Carter's three-step integrity model from "Integrity" (Basic Books, 1996).

## 🔧 Technical Details

**Supported Content Types:**

- Long-form articles (1000-5000+ words)
- YouTube videos (all lengths)
- Social media threads and posts
- Research reports and analysis
- Response journalism and fact-checks

**Quality Standards:**

- Multi-source verification requirements
- Professional journalism ethics compliance
- Platform optimization best practices
- Systematic fact-checking methodology
- All tasks and agents focused exclusively on reporting/journalism (creative writing elements removed)
- Carter integrity framework integration for ethical analysis

---

**Version:** 1.0.0
**Compatible with:** BMAD Method v4.0+
**Focus:** Independent journalism, content creation, fact-checking, platform optimization
**Last Updated:** 8/26/2025
