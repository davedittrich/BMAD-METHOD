# Content Creation Toolkit - Development Roadmap

**Module:** content-creation
**Version:** 1.0.0 (Phase 1 MVP - In Progress)
**Last Updated:** 2025-10-18

---

## Phase 1: MVP (Text-Based Content Pipeline)

**Goal:** Prove the core pipeline for text-based content creation
**Target:** Response Journalism use case (User Story 2)

### ✅ Completed

- [x] Module structure and directory scaffolding
- [x] Module configuration (config.yaml)
- Module installer configuration
  - [x] Created
  - [ ] Validated
- Module README documentation
  - [x] Created
  - [ ] Validated
- Producer agent (primary entry point)
  - [x] Created
  - [ ] Validated
- research-article workflow (complete with instructions, template, checklist)
  - [x] Created
  - [ ] Validated

### ✅ Completed (Updated 2025-10-18)

- [x] **Core Tasks (Priority 1)** - ALL COMPLETE
  - [x] analyze-integrity.md (Carter Framework - analytical)
  - [x] analyze-fallacies.md (Damer Framework - analytical)
  - [x] analyze-style.md (Style extraction)
  - [x] guide-integrity-writing.md (Carter Framework - generative)
  - [x] guide-argument-construction.md (Damer Framework - generative)
  - [x] apply-style.md (Style application)
  - [x] check-integrity.md (Carter Framework - QA)
  - [x] check-argument-quality.md (Damer Framework - QA)

### 🔄 In Progress (Priority 2)

**Next Up: Create Remaining Agents**

### 📋 Remaining Agents (Priority 2)

**Pre-Production Team:**

- archival-researcher.agent.yaml
  - [x] Created
  - [ ] Validated
- subject-analyst.agent.yaml
  - [x] Created
  - [ ] Validated
- fact-checker.agent.yaml
  - [x] Created
  - [ ] Validated

**Production Team:**

- director.agent.yaml
  - [x] Created
  - [ ] Validated
- screenwriter.agent.yaml
  - [x] Created
  - [ ] Validated
- editor.agent.yaml
  - [x] Created
  - [ ] Validated
- style-analyst.agent.yaml
  - [x] Created
  - [ ] Validated

**Post-Production Team:**

- distribution-manager.agent.yaml
  - [x] Created
  - [ ] Validated
- audience-engagement-manager.agent.yaml
  - [x] Created
  - [ ] Validated

**Specialists:**

- argument-analyst.agent.yaml
  - [x] Created
  - [ ] Validated
- integrity-analyst.agent.yaml
  - [x] Created
  - [ ] Validated
- fallacy-detective.agent.yaml
  - [x] Created
  - [ ] Validated
- style-guide.agent.yaml
  - [x] Created
  - [ ] Validated

### 📋 Remaining Workflows (Priority 3)

- **analyze-and-respond** (Complex)
  - [x] Created
  - [ ] Validated
  - Critical analysis workflow
  - Integrity and fallacy framework application
  - Iterative source addition support

- **format-article** (Standard)
  - [x] Created
  - [ ] Validated
  - Platform-specific formatting
  - Image sourcing and integration
  - Link preview handling

- **publish-article** (Standard)
  - [x] Created
  - [ ] Validated
  - Medium/Substack/WordPress integration
  - Metadata and SEO handling
  - API authentication

### 🎯 Phase 1 Deliverable

**Success Criteria:**

- User can start with topic or sources
- research-article workflow produces integrity-validated, fallacy-checked article
- Article matches user's style profile
- Article can be formatted for specific platform
- Article can be published to Medium or Substack

---

## Phase 2: Video & Promotion Enhancement

**Goal:** Expand pipeline to include video production and multi-platform promotion
**Target:** Article to Video use case (User Story 1)

### 📋 Video Production Workflows

- [ ] **create-video-assets** (Complex)
  - Script to storyboard conversion
  - Audio generation (text-to-speech)
  - Visual asset provisioning (AI-generated or user-provided)
  - Two output paths: Production kit OR AI-generated video

- [ ] **publish-video** (Complex)
  - YouTube/TikTok integration
  - Metadata and thumbnail handling
  - Platform API authentication

### 📋 Promotion Workflows

- [ ] **adapt-for-social-media** (Standard)
  - Content breakdown and analysis
  - Platform-native format creation (Twitter threads, LinkedIn carousels)
  - YouTube Shorts script generation

- [ ] **promote-content** (Standard)
  - Content analysis for promotional hooks
  - Multi-platform post generation
  - Scheduling integration

### 🎯 Phase 2 Deliverable

**Success Criteria:**

- User can transform article into video production kit
- User can publish video to YouTube with proper metadata
- User can adapt long-form content to social media posts
- User can generate and schedule promotional campaigns

---

## Phase 3: Advanced Analysis & Automation

**Goal:** Implement complex, data-intensive features
**Target:** All user scenarios including Debate Analysis (User Story 4)

### 📋 Advanced Features

- [ ] **Thematic & Argument Extraction System**
  - Cross-content analysis engine
  - Structured argument database
  - Topic and fallacy identification at scale

- [ ] **create-content-series** Orchestrator (Complex)
  - Series-wide planning and coordination
  - Automatic workflow invocation
  - Thematic consistency enforcement
  - Progress tracking and reporting

- [ ] **Full AI Video Generation**
  - Complete video assembly and rendering
  - Manual asset integration
  - Advanced editing capabilities

### 📋 Additional Platform Integrations

- [ ] Twitter/X API integration
- [ ] LinkedIn API integration
- [ ] WordPress API integration
- [ ] Additional video platforms (Vimeo, etc.)

### 📋 UX Enhancements

- [ ] Progress tracking across workflows
- [ ] Resource allocation and scheduling
- [ ] Quality gate checkpoints between tiers
- [ ] Session persistence and resume capability

### 🎯 Phase 3 Deliverable

**Success Criteria:**

- All four user scenarios executable end-to-end
- Debate analysis with argument database functional
- Multi-part series orchestration working
- All planned platforms integrated

---

## Quick Commands

### Create New Components

**Create a new agent:**

```bash
# Load BMB Builder module
@bmb

# Run create-agent workflow
*create-agent
```

**Create a new workflow:**

```bash
# Load BMB Builder module
@bmb

# Run create-workflow workflow
*create-workflow
```

**Create a new task:**

```bash
# Tasks are simpler - create manually in tasks/ folder
# Follow existing task structure from BMM module
```

### Test & Validate

**Test the module:**

```bash
# Run installer to compile agents
npm run install:bmad

# Select content-creation module
# Choose "Compile Agents" option
```

**Validate workflows:**

```bash
# Load Producer agent
@producer

# Try each workflow
*research-article
*analyze-respond
# etc.
```

---

## Development Notes

### Priority Guidelines

**Critical Path (Phase 1 MVP):**

1. Complete all 8 core tasks first (integrity, fallacy, style)
2. Create Pre-Production agents (research team)
3. Create Production agents (writing team)
4. Create Specialist agents (frameworks)
5. Complete analyze-and-respond workflow
6. Complete format-article workflow
7. Complete publish-article workflow
8. Test full MVP pipeline end-to-end

**After MVP (Phase 2):**

1. Focus on video workflows (create-video-assets, publish-video)
2. Then promotion workflows (adapt, promote)
3. Create Post-Production agents
4. Test video pipeline end-to-end

**Polish Phase (Phase 3):**

1. Build orchestration workflow (create-content-series)
2. Implement argument database
3. Add remaining platform integrations
4. UX enhancements based on usage feedback

### Technical Considerations

**Style Examples:**

- Need at least 3 default style profiles in `_module-installer/assets/style-examples/`
- Consider: journalistic.md, academic.md, conversational.md
- Each should be 1000+ words for good pattern extraction

**External APIs:**

- All API integrations should be optional
- Graceful degradation if API unavailable
- Clear error messages for rate limits
- Token refresh handling where applicable

**Data Management:**

- Implement cleanup for `cache/temp-assets/` (files older than 7 days)
- Style profiles should persist in `cache/style-profiles/`
- User sources should never be auto-deleted

**Methodology Porting:**

- Port v4 `integrity-analysis.md` checklist to task format
- Port v4 `logical-fallacy-analysis.md` checklist to task format
- Adapt v4 style analysis code to new framework

### Testing Strategy

**Per-Component Testing:**

- Each agent should be tested independently
- Each workflow should handle edge cases gracefully
- Each task should validate inputs

**Integration Testing:**

- Full pipeline tests for each user scenario
- Cross-workflow data passing
- Multi-agent coordination

**User Acceptance Testing:**

- Real content creation projects
- Diverse style examples
- Multiple platform publishing attempts

---

## Known Issues & Future Enhancements

### Known Issues

- [ ] Style profile generation requires manual trigger (should be automatic)
- [ ] API error handling needs more comprehensive coverage
- [ ] Workflow state persistence not yet implemented

### Future Enhancements

- [ ] Real-time collaboration support (multiple users on same project)
- [ ] Version control for article iterations
- [ ] A/B testing support for headlines and intros
- [ ] Analytics integration for published content
- [ ] SEO optimization suggestions
- [ ] Plagiarism detection
- [ ] Accessibility checking (WCAG compliance)
- [ ] Multi-language support

---

## Resources

### Internal References

- **Module Brief:** `/docs/module-brief-temp-module-brief-2025-10-13.md`
- **Component Architecture:** `/docs/content-creation-module-components.md`
- **Module Identity:** `/docs/content-creation-module-identity.md`

### BMad Core References

- **Agent Creation:** `bmad/bmb/workflows/create-agent/`
- **Workflow Creation:** `bmad/bmb/workflows/create-workflow/`
- **Example Agents:** `bmad/bmm/agents/`
- **Example Workflows:** `bmad/bmm/workflows/`

### External References

- **Carter Integrity Framework:** "Integrity" by Stephen L. Carter
- **Damer Fallacy Framework:** "Attacking Faulty Reasoning" by T. Edward Damer
- **Content Strategy:** "Everybody Writes" by Ann Handley

---

## Contribution Guidelines

### Adding New Agents

1. Use `*create-agent` workflow from BMB module
2. Follow Documentary Film Crew theme
3. Coordinate with existing agents via menu commands
4. Include methodology awareness (Carter, Damer, Style)

### Adding New Workflows

1. Use `*create-workflow` workflow from BMB module
2. Determine tier placement (1-4)
3. Follow existing workflow patterns
4. Include proper validation checklists
5. Update Producer agent menu

### Adding New Tasks

1. Create in `tasks/` directory
2. Follow naming convention: `verb-noun.md`
3. Include input validation
4. Include output specification
5. Document methodology application

---

## Questions & Decisions Log

### Open Questions

- [ ] Should style analysis be automatic on workflow start or user-triggered?
- [ ] How to handle style conflicts (user writes in style A, wants output in style B)?
- [ ] Should we support collaborative editing workflows?
- [ ] What's the best way to handle large video assets (storage/transfer)?

### Design Decisions

- **Decision:** Use real-time guidance during drafting vs post-draft validation
  - **Rationale:** More efficient token usage, better quality from start
  - **Date:** 2025-10-14

- **Decision:** Support both research-first and writing-first approaches
  - **Rationale:** Different users have different workflows
  - **Date:** 2025-10-14

- **Decision:** Separate Style Analyst (internal) from Style Guide (external matching)
  - **Rationale:** Different concerns - consistency vs conformance
  - **Date:** 2025-10-14

---

**Next Steps:**

1. ✅ Module scaffolding complete
2. ✅ Producer agent created
3. ✅ research-article workflow created
4. ✅ **DONE: Created all 8 core tasks (2025-10-18)**
5. ➡️ **NOW: Create remaining agents (Priority 2)**
6. Create remaining Phase 1 workflows
7. End-to-end testing of MVP
8. Move to Phase 2

---

_This roadmap is a living document. Update as development progresses._
