# Telos — Dave's Personal Reflection System

This repo is Dave's personal telos — a living system for self-reflection, pattern recognition, and alignment. It is not a software project. There is no code to build, no app to ship.

## Lineage

This implements Daniel Miessler's [TELOS framework](https://github.com/danielmiessler/Telos) — a structured approach to personal purpose, derived from Aristotle's concept of Eudaimonia (human flourishing). TELOS sits within Miessler's larger [Human 3.0](https://danielmiessler.com/blog/how-my-projects-fit-together) vision alongside:

- **Substrate** — Philosophy for human organization
- **Fabric** — AI patterns applied to human input (powers `scripts/` and `findings/` here)
- **TELOS** — Personal mission → goals → strategy → action ← *this repo*
- **Daemon** — Behavior change system

The core idea: everything you do should trace back to a problem you're trying to solve.

## The Conceptual Chain

```
Problems → Mission → Narratives → Goals → Challenges → Strategies → Projects → Journal
```

Every telos file maps to a link in this chain. The chain flows downward from *why* to *what* to *how* to *what happened*. Anything that can't trace back up to a Problem is drift.

### Example 1: The Inn as Mission

```
Problem:    Lives of means felt empty and purposeless
  ↓
Mission:    Loving people, however they come into our orbit
  ↓
Narrative:  Born from loss — Tonia's inability to abandon people,
            extended outward into an institution
  ↓
Goal:       Build something that confers pride on everyone in its orbit
  ↓
Challenge:  The Resistance — avoiding guest interactions despite
            knowing they fuel purpose
  ↓
Strategy:   (emerging — showing up for breakfast, happy hour)
  ↓
Project:    White Doe Inn — daily operations, kitchen remodel, staffing
  ↓
Journal:    "Showed up today. Felt it." / "Didn't show up. Noticed."
```

### Example 2: Excellence as Ethic

```
Problem:    Half-effort is the same as not caring
  ↓
Mission:    Excellence for its own sake — not for reputation or reviews
  ↓
Narrative:  The Bear, Forks episode — invisible work defines who you are
  ↓
Goal:       The plumber brags, the inspector benchmarks against us
  ↓
Challenge:  Tonia's fingerprints — the Hierarchy of Care needs both
            signatures to be complete
  ↓
Strategy:   (unresolved — may not be resolvable the way Dave wants)
  ↓
Project:    Hierarchy of Care — Safety → Comfort → Connection →
            Cuisine → Beauty → Captivation
  ↓
Journal:    "Built it alone. Her emphasis is different. Incomplete."
```

## File Map

| Chain Link | File(s) | Status |
|---|---|---|
| Problems | *(not yet separated from BELIEFS.md)* | To develop |
| Mission | `MISSION.md` | Populated |
| Narratives | `NARRATIVES.md` | To develop |
| Goals | `GOALS.md` | To develop |
| Challenges | `CHALLENGES.md` | Populated |
| Strategies | `STRATEGIES.md` | To develop |
| Projects | `PROJECTS.md` | To develop |
| Journal | `journal/` | Active |

Supporting files outside the chain:
- `BELIEFS.md` — What Dave holds true (contains latent Problems)
- `TRAUMAS.md` — Context for patterns and wiring
- `LEARNED.md` — Lessons from experience (calibration)
- `PERSONALITY.md` — The human stuff
- `BACKGROUND.md` — Professional history
- `captures/` — Raw telos moments
- `findings/` — Fabric analysis output
- `synthesis/` — Monthly narrative syntheses

## The Rhythm

Nothing edits telos files automatically. Everything creates new files (findings, synthesis) or prints to stdout. Telos file changes are always proposals from Reid, approved by Dave.

### Anytime: Capture

When something reveals who Dave is — a decision, a reaction, an avoidance — write a raw capture to `captures/YYYY-MM-DD-description.md`.

For decisions, run an alignment check:
```bash
echo "I'm thinking about skipping breakfast to finish this build" | ./scripts/alignment-check.sh -
```
**Fabric pattern:** `wdi_telos_alignment_check` — evaluates against telos files.

### Daily (morning): Process Yesterday

If there were journal entries or captures yesterday, run them through the pipeline:
```bash
./scripts/process-journal.sh journal/YYYY-MM-DD.md
```

Three Fabric patterns run in sequence:

| Step | Pattern | What it does | Output |
|---|---|---|---|
| 1 | `personal_telos_excavation` | What's beneath the words | `findings/DATE-excavation.md` |
| 2 | `wdi_expand_telos_from_anecdote` | Maps entry to telos files — what should update where | `findings/DATE-telos-map.md` |
| 3 | `t_find_blindspots` | Reads entry against MISSION + BELIEFS + TRAUMAS + LEARNED — what's not being seen | `findings/DATE-blindspots.md` |

Reid reviews findings and flags what's worth attention. If a finding suggests a telos update, Reid proposes it.

### Weekly (Sunday evening): Journal Prompt

```bash
./scripts/generate-prompt.sh
```

**Fabric pattern:** `personal_telos_journal_prompt` — reads all populated telos files + recent journals + recent captures, generates 3-5 questions targeted at what's thin, stale, or unresolved.

Dave answers whichever ones land. Saves to `journal/YYYY-MM-DD.md`.

### Bi-weekly (every other Friday): Pattern Report

Reid runs full telos through blindspot analysis and contradiction mapping. Summarizes what's changed, what's stuck, what's emerging. This is where telos file updates are most likely proposed.

**Fabric patterns:** `t_find_blindspots` (full telos), contradiction mapping.

### Monthly (1st of month): Narrative Synthesis

```bash
./scripts/monthly-synthesis.sh          # defaults to previous month
./scripts/monthly-synthesis.sh 2026-02   # or specify
```

**Fabric pattern:** `personal_telos_monthly_narrative` — reads all journals, captures, and findings from the month against telos context. Produces a ~500 word narrative saved to `synthesis/YYYY-MM-narrative.md`.

The instruction: read it. Your reaction to it is data too.

### After any telos file changes: Rebuild Fabric context

```bash
./scripts/build-fabric-context.sh
```

Concatenates core telos files into `~/.config/fabric/contexts/telos.md` so all Fabric patterns have current context.

### Quick Reference

| When | Action | Script | Fabric pattern(s) | Creates |
|---|---|---|---|---|
| Anytime | Capture a moment | — | — | `captures/` file |
| Anytime | Check a decision | `alignment-check.sh` | `wdi_telos_alignment_check` | Stdout |
| Daily | Process yesterday | `process-journal.sh` | excavation, anecdote→telos, blindspots | 3 `findings/` files |
| Weekly | Journal from prompt | `generate-prompt.sh` | `personal_telos_journal_prompt` | `journal/` entry |
| Bi-weekly | Pattern report | Reid runs it | blindspots, contradictions | `findings/` files |
| Monthly | Narrative synthesis | `monthly-synthesis.sh` | `personal_telos_monthly_narrative` | `synthesis/` file |
| After edits | Rebuild context | `build-fabric-context.sh` | — | Updates Fabric context |

## Rules

1. **Dave owns this.** Propose telos updates — never write them unilaterally.
2. **Raw is sacred.** Never edit captures or journal entries after creation.
3. **No guilt.** The system is a mirror, not a scorecard.
4. **No therapy.** Notice patterns. Don't diagnose.
5. **Privacy is absolute.**

## Working in This Repo

- New journal entries go in `journal/YYYY-MM-DD.md`
- New captures go in `captures/YYYY-MM-DD-description.md`
- When Dave says "that's a telos moment," write a raw capture
- For alignment checks, evaluate decisions against the telos files and the conceptual chain
- Keep telos file updates as proposals for Dave to approve or reject
- When something feels disconnected, trace it up the chain — if it doesn't reach a Problem, name why

## Help Command

When Dave says "telos help", display this:

```
TELOS RHYTHM
─────────────────────────────────────────────────────────

  Anytime     "that's a telos moment"  → capture saved
              alignment-check.sh       → decision vs telos

  Daily       process-journal.sh       → excavation, telos map, blindspots
                                         (3 findings files)

  Weekly      generate-prompt.sh       → 3-5 journal questions
  (Sunday)                               from what's thin/stale/unresolved

  Bi-weekly   pattern report           → blindspots + contradictions
  (Friday)                               across full telos

  Monthly     monthly-synthesis.sh     → 500-word narrative of the month
  (1st)                                  saved to synthesis/

  After edits build-fabric-context.sh  → rebuild Fabric context

CONCEPTUAL CHAIN
─────────────────────────────────────────────────────────

  Problems → Mission → Narratives → Goals →
  Challenges → Strategies → Projects → Journal

  If it can't trace back to a Problem, it's drift.

FILES
─────────────────────────────────────────────────────────

  Populated:   MISSION  BELIEFS  TRAUMAS  LEARNED
               CHALLENGES  PERSONALITY  BACKGROUND
  To develop:  PROBLEMS  NARRATIVES  GOALS  STRATEGIES
               PROJECTS  WRONG  MODELS
  Active:      journal/  captures/  findings/  synthesis/

RULES
─────────────────────────────────────────────────────────

  1. Dave owns this — proposals only, never unilateral edits
  2. Raw is sacred — never edit captures or journals
  3. No guilt — mirror, not scorecard
  4. No therapy — patterns, not diagnoses
  5. Privacy is absolute
```
