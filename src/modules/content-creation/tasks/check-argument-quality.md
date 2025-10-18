# check-argument-quality

## Task Overview

Perform final quality assurance check on completed content to verify logical soundness and argument quality using T. Edward Damer's "Attacking Faulty Reasoning" methodology, ensuring all arguments meet the five criteria for good arguments before publication.

## Instructions

1. **Pre-Check Preparation**
   - Review complete content and identify all arguments made
   - Create inventory of main claims and supporting arguments
   - Map logical structure and argument dependencies
   - Note all evidence and sources cited
   - Identify counterarguments addressed (or not addressed)

2. **Structural Validity Check (Criterion 1)**
   - Verify all arguments have valid logical form
   - Check for internal consistency throughout
   - Confirm conclusions follow from premises
   - Identify any invalid reasoning patterns
   - Verify all logical connections are sound
   - Pass/Fail: Is logical structure valid?

3. **Relevance Check (Criterion 2)**
   - Verify all premises genuinely support their conclusions
   - Identify any irrelevant information or digressions
   - Check that evidence directly addresses claims
   - Flag any red herrings or tangential material
   - Ensure all reasoning stays on point
   - Pass/Fail: Are all premises relevant?

4. **Acceptability Check (Criterion 3)**
   - Verify all premises would be accepted by rational people
   - Check quality and credibility of sources cited
   - Identify controversial premises needing more support
   - Verify factual claims are accurate and sourced
   - Check for reliance on questionable assumptions
   - Pass/Fail: Are all premises acceptable?

5. **Sufficiency Check (Criterion 4)**
   - Verify adequate quantity and quality of evidence for each claim
   - Check for hasty generalizations or insufficient support
   - Assess whether evidence strength matches claim strength
   - Identify claims that need additional evidence
   - Verify representative examples are used (not cherry-picked)
   - Pass/Fail: Is evidence sufficient for all claims?

6. **Rebuttal Check (Criterion 5)**
   - Verify significant counterarguments are addressed
   - Check that opposing views are fairly represented (steel-man, not straw-man)
   - Assess whether rebuttals effectively answer objections
   - Identify counterarguments that should be addressed but aren't
   - Verify responses to objections are logically sound
   - Pass/Fail: Are counterarguments properly addressed?

7. **Fallacy Detection Scan**
   - Systematically scan for common formal and informal fallacies
   - Check for criterion violations (each maps to fallacy types)
   - Document each fallacy found with location and severity
   - Classify as blocking (must fix) or non-blocking (should fix)
   - Provide specific corrections for each fallacy identified

8. **Code of Intellectual Conduct Compliance**
   - Verify principle of charity applied to opposing views
   - Check for intellectual humility and appropriate qualifications
   - Assess fairness in representation of disagreements
   - Verify absence of personal attacks or ad hominem
   - Confirm constructive rather than purely critical approach

9. **Final Assessment and Certification**
   - Assign rating (1-5) for each of Damer's five criteria
   - Calculate overall argument quality score
   - List all logical issues requiring correction (blocking)
   - List recommended improvements (non-blocking)
   - Provide quality certification or revision requirements
   - Document decision: Ready for publication OR Needs revision

## Elicitation Requirements

elicit: true
format: |
Please provide:

**Content for QA Check:**

- What content needs argument quality QA? (provide full text or file path)
- Who is the author?
- What is the intended publication venue/audience?

**Check Parameters:**

- What is the required quality threshold? (strict vs. standard)
- Are there specific argument types to focus on?
- Is this a pre-publication check or post-publication audit?

**Context:**

- What is the subject matter and domain?
- What level of logical rigor is expected for this venue?
- Are there known controversial claims to scrutinize?

## Output Requirements

Deliver comprehensive QA argument quality check including:

- Rating (1-5) for each of Damer's five criteria with justification
- Overall argument quality score and assessment
- Detailed inventory of all logical issues found (blocking and non-blocking)
- Complete fallacy scan with specific examples and locations
- Required corrections for publication approval
- Recommended improvements for strengthening arguments
- Assessment of Code of Intellectual Conduct compliance
- Normal form reconstructions of key arguments for verification
- Overall quality certification decision (Approved/Revision Required)
- Documentation trail for quality assurance verification
