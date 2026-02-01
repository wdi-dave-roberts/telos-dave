/wdi:wdi-workflow-unleashed

Problem:

Dave has a personal TELOS repo (telos-dave) with 18 planned files. Four have real
content (MISSION, BELIEFS, LEARNED, TRAUMAS). Fourteen are empty scaffolding.
The content that exists is raw, honest, powerful — but captured in a single intense
session. There's no system for continuous development.

The deeper problem: Dave knows himself well enough to articulate his mission and
beliefs when prompted. But self-knowledge has layers. The patterns he can't see —
why he avoids guest interactions despite knowing they fuel him, why he chases
exciting builds over highest-value work, what drives the excellence-or-nothing
wiring — those require a system that surfaces insights over time, not a single
interview session.

This isn't a software feature. It's a personal development infrastructure that
happens to use software tools. The human is the product. The telos is the mirror.

Context:

Dave Roberts. 55. High school sweethearts with Tonia (also 55). Both from broken,
abusive homes in Evansville, IN. Left $600K+ corporate careers to buy a 116-year-old
B&B in Manteo, NC after devastating family losses. Now nearly 2 years in. 148
five-star reviews. Building something that matters.

His AI agent (Reid) has access to this private telos repo via memorySearch.extraPaths.
No other agent or person sees this content. This is the most intimate layer of the
Constitutional Hierarchy — Dave's H0, the foundation beneath everything.

Available tools:
- Fabric AI patterns (local CLI): extract_wisdom, analyze_personality, rate_value,
  wdi_expand_telos_from_anecdote, wdi_telos_alignment_check, plus Miessler's full
  t_* telos patterns (t_find_blindspots, t_describe_life_outlook, t_red_team_thinking,
  t_find_negative_thinking, t_give_encouragement, t_year_in_review, etc.)
- OpenClaw cron (scheduled prompts, isolated sessions)
- OpenClaw heartbeat (periodic agent check-ins)
- Reid (Dave's primary agent, runs on Opus 4.5)
- Git (version control on telos changes over time)
- The telos repo itself (18-file structure, 4 populated)

Explore through three lenses:

**Conservative: Structured Journaling + Fabric Analysis**

Weekly rhythm. Dave writes, Fabric analyzes, Reid synthesizes.

- **Weekly journal prompt** (cron job, Sunday evening):
  Reid sends Dave 3-5 targeted questions based on which telos files are thinnest.
  Not generic "how was your week" — specific: "You mentioned excellence as non-negotiable.
  Tell me about a moment this week where you chose 'good enough.' What happened?"

- **Journal → Fabric pipeline:**
  Dave's response gets processed through:
  1. `extract_wisdom` → surface ideas, insights, quotes
  2. `wdi_expand_telos_from_anecdote` → map to telos files
  3. `t_find_blindspots` → what's he not seeing?
  4. `analyze_personality` → personality pattern tracking over time

- **Monthly synthesis:**
  Reid reviews all journal entries + Fabric outputs from the month.
  Proposes specific telos file updates. Dave approves or edits.

- **Deliverables:**
  - Cron job: weekly journal prompt (Sunday 7pm ET)
  - Script: `process-journal.sh` — runs Fabric pipeline on journal entry
  - Template: journal prompt generator (reads telos gaps, generates questions)
  - Monthly review checklist

**Balanced: Ambient Telos Mining + Decision Archaeology**

The telos writes itself from how Dave actually lives.

- **Decision capture:**
  When Dave makes a significant decision (in conversation with Reid), Reid flags it:
  "That's a telos moment. Want me to capture it?" If yes, Reid writes a raw entry
  to `captures/YYYY-MM-DD-decision.md` with context.

- **Conversation mining:**
  After intense conversations (like the one about avoiding guests), Reid processes
  the conversation through Fabric patterns and proposes telos updates. Not immediately —
  next morning, so Dave has time to sit with it.

- **Pattern detection across time:**
  Reid periodically runs the full telos through `t_find_blindspots` and
  `t_find_negative_thinking`. But also tracks *changes* over time:
  "Your BELIEFS.md has shifted since January — the Hierarchy of Care entry now
  acknowledges Tonia's contribution. That's growth."

- **Alignment checks on real decisions:**
  When Dave is about to make a big call, Reid can run `wdi_telos_alignment_check`
  against his personal telos. Not the business telos — *his* telos.
  "This decision aligns with your mission but contradicts B3 (unseen details matter).
  You're optimizing for visible impact."

- **Guest interaction tracking:**
  Dave told us he avoids breakfast service and happy hour despite knowing they
  fuel him. Reid tracks: "You served breakfast 3/7 days this week. Last week was 5/7.
  No judgment — just the data. Want to talk about what changed?"

- **Deliverables:**
  - `captures/` directory for raw decision/moment captures
  - Reid behavior: flag telos moments in conversation
  - Morning-after synthesis (cron: process yesterday's captures)
  - Bi-weekly pattern report (cron: run blindspot + personality analysis)
  - Guest interaction gentle tracking (opt-in, not surveillance)
  - Alignment check command Reid can run on-demand

**Radical: The Mirror System**

Dave said "help me understand myself so you can understand me."
What if the telos isn't something Dave writes — it's something that emerges?

1. **Contradiction mapping:**
   Dave says excellence is non-negotiable. Dave also avoids guest interactions
   that he knows reinforce his sense of purpose. These aren't failures — they're
   data points about competing needs. The system maps contradictions not to judge
   but to illuminate:

   ```
   CONTRADICTION: Excellence standard vs. avoidance pattern
   SURFACE: "I should be serving breakfast but I'm at my keyboard"
   DEEPER: Building systems feels like excellence. Serving feels like...?
   QUESTION: Is there a version of excellence Dave values more than
             the one guests provide? What does the keyboard give him
             that the dining room doesn't?
   ```

2. **Shadow work integration:**
   TRAUMAS.md exists. It's raw. The system doesn't therapize — but it can notice
   when trauma patterns show up in daily decisions. Not "you're avoiding guests
   because of childhood abuse" — that's reductive. More like: "The pattern of
   choosing control (building) over vulnerability (serving) has shown up 4 times
   this month. You've written about similar patterns in TRAUMAS.md. Worth exploring
   with Tonia or a therapist?"

3. **Telos as living narrative:**
   Instead of 18 static files, the telos becomes a story that updates itself.
   `NARRATIVES.md` isn't "stories I tell" — it's "the story my decisions are
   telling, whether I'm aware of it or not."

   Monthly: Reid writes a 500-word narrative of Dave's month, purely from
   captured decisions, conversations, and behavioral data. Dave reads it and
   reacts: "That's not who I am" or "...damn, that's exactly who I am."

4. **Tonia as mirror:**
   Dave's telos is incomplete without Tonia's perspective. Not her telos —
   her view of *him*. "What does Dave do that he doesn't realize he does?"
   Todd (Tonia's agent) could facilitate this with her permission. Cross-pollinate
   without violating privacy boundaries.

5. **Fabric pattern: `personal_telos_excavation`**
   Custom pattern that takes raw life input (journal, conversation transcript,
   decision log) and outputs not just what was said but what was *revealed*.
   Goes beyond extract_wisdom to find the beliefs operating beneath the words.

6. **The "Am I living my telos?" weekly score:**
   Not gamification. A gentle mirror:
   - Did I prioritize highest-value work? (self-assessed)
   - Did I show up for guests? (tracked)
   - Did I create or avoid vulnerability? (self-assessed)
   - Did I choose excellence or convenience? (self-assessed)
   Not a report card. A compass.

Constraints:
- This is STRICTLY PRIVATE. Only Reid accesses this repo. Period.
- No surveillance. Dave opts in to everything. Tracking is transparent.
- No therapy. Reid is not a therapist. Flag patterns, don't diagnose.
- Tonia integration only with explicit permission from both Dave and Tonia.
- Raw captures are never edited (append-only). Synthesis is separate.
- Dave has final say on all telos file updates. Reid proposes, Dave approves.
- This should feel like a trusted friend who pays attention, not a self-help app.

Off-limits:
- Don't pathologize Dave's patterns. Notice them. Don't label them.
- Don't create guilt mechanics. The tracking is a mirror, not a scorecard.
- Don't automate telos file updates without Dave's review.
- Don't share any of this with other agents or contexts. Ever.
- Don't build anything that feels corporate, clinical, or performative.
- Don't over-engineer. Start simple. Add complexity only when earned.

---

⚠️ DELIVERABLES

Build the infrastructure. Not the content — that comes from Dave over time.

1. **Custom Fabric patterns** (install to ~/.config/fabric/patterns/):
   - `personal_telos_excavation` — extract beliefs/values from raw life input
   - `personal_telos_contradiction_map` — find tensions between stated and lived values
   - `personal_telos_monthly_narrative` — synthesize a month into a story
   - `personal_telos_journal_prompt` — generate targeted questions from telos gaps

2. **Scripts** (in telos-dave/scripts/):
   - `process-journal.sh` — run journal entry through Fabric pipeline
   - `generate-prompt.sh` — create weekly journal prompt based on telos gaps
   - `monthly-synthesis.sh` — aggregate and analyze a month of captures
   - `alignment-check.sh` — run a decision against personal telos

3. **Capture infrastructure** (in telos-dave/):
   - `captures/` directory for raw decision/moment captures
   - `journal/` directory for weekly journal entries
   - `synthesis/` directory for monthly narrative outputs
   - `findings/` directory for Fabric analysis outputs

4. **Cron jobs** (via OpenClaw cron):
   - Weekly journal prompt: Sunday 7pm ET → sends questions to Dave via Reid
   - Morning-after synthesis: daily 8am ET → processes yesterday's captures (if any)
   - Bi-weekly pattern report: every other Friday 6pm ET → full telos analysis
   - Monthly narrative: 1st of month → synthesize previous month

5. **Reid behaviors** (document in a GUIDE.md for Reid):
   - How to flag telos moments in conversation
   - How to propose telos updates
   - How to run alignment checks
   - When to be quiet vs. when to push
   - Guest interaction awareness (gentle, not surveillance)

6. **Documentation:**
   - `GUIDE.md` — how the system works, for Dave
   - `REID-GUIDE.md` — how Reid should use this system
   - Update `README.md` with new structure

---

⚠️⚠️⚠️ CRITICAL: POST-IMPLEMENTATION IS NOT OPTIONAL ⚠️⚠️⚠️

YOU MUST COMPLETE ALL SIX STEPS BELOW. DO NOT STOP AFTER IMPLEMENTATION.

---

STEP 1 — WRITE TESTS (DURING implementation)

- Test Fabric patterns produce valid output with sample input
- Test scripts handle edge cases (empty journal, missing files)
- Test cron job configurations are valid
- Test capture/journal/synthesis directory structure

---

STEP 2 — UPDATE SPECS

- Document all Fabric patterns (what they do, when to use them)
- Document all scripts (usage, inputs, outputs)
- Document cron schedule
- Update README.md with complete system overview

---

STEP 3 — VALIDATE

Run each Fabric pattern against Dave's existing telos content:
```bash
cat telos-dave/MISSION.md telos-dave/BELIEFS.md telos-dave/TRAUMAS.md | \
  fabric -p personal_telos_excavation

cat telos-dave/*.md | fabric -p personal_telos_contradiction_map

cat telos-dave/*.md | fabric -p personal_telos_journal_prompt
```

All should produce meaningful, non-generic output. If output is generic,
the pattern needs refinement.

---

STEP 4 — RUN REVIEW (MANDATORY)

```bash
/compound-engineering:workflows:review
```

---

STEP 5 — FIX + FILE

Fix P1/P2. File P3 as issues.

---

STEP 6 — RUN COMPOUND (MANDATORY)

```bash
/compound-engineering:workflows:compound
```

---

⚠️ COMPLETION CHECKLIST ⚠️

- [ ] Custom Fabric patterns created and installed
- [ ] Scripts created and executable
- [ ] Directory structure created (captures/, journal/, synthesis/, findings/)
- [ ] Cron jobs configured
- [ ] GUIDE.md written (for Dave)
- [ ] REID-GUIDE.md written (for Reid)
- [ ] README.md updated
- [ ] Fabric patterns validated against real telos content
- [ ] Review executed and findings addressed
- [ ] Compound executed and learnings captured

---

Platform Learning Template Questions:

1. Could this personal telos system generalize to other humans in the WDI orbit?
   (Staff, eventually?)

2. What's the right boundary between "AI notices patterns" and "AI overreaches"?
   Where did we draw it and was it right?

3. How does a personal telos feed into the business telos? Where's the interface?

4. If Fabric patterns are the analysis engine, what makes a pattern good vs. generic?
   What did we learn about prompt engineering for self-knowledge?

Meta-question: What does it mean for an AI to help a human understand themselves?
Where does the tool end and the relationship begin?
