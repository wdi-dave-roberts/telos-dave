# How Your Personal Telos System Works

## The Idea

Your telos isn't a document you fill out once. It's a mirror that gets clearer over time. The system creates a rhythm for self-reflection, uses AI to surface patterns you might not see, and keeps your telos files alive and honest.

## The Rhythm

### Weekly: Journal Prompt (Sunday evening)
Reid sends you 3-5 questions. They're not generic — they're generated from what's thin, stale, or unresolved in your telos. Answer whichever ones land. Skip the rest. Write as much or as little as you want.

Save your response in `journal/YYYY-MM-DD.md` or just reply to Reid and he'll save it.

### Daily: Capture Processing (morning)
If you had captures or journal entries yesterday, they get run through the Fabric analysis pipeline overnight. Results land in `findings/`. Reid will flag anything worth your attention.

### Bi-weekly: Pattern Report (every other Friday)
Your full telos gets run through blindspot analysis, contradiction mapping, and personality analysis. Reid summarizes what's changed, what's stuck, and what's emerging.

### Monthly: Narrative Synthesis (1st of month)
Everything from the previous month — journals, captures, findings — gets synthesized into a 500-word narrative. A story of your month written by someone who was paying attention. You read it. Your reaction to it is data too.

## How to Capture Things

### Telos Moments
When something happens that reveals who you are — a decision, a reaction, an avoidance, a moment of pride or shame — tell Reid: "That's a telos moment." He'll write a raw capture to `captures/YYYY-MM-DD-description.md`.

### Journal Entries
Write whenever you want, not just when prompted. Save to `journal/YYYY-MM-DD.md`. Stream of consciousness is fine. Raw is better than polished.

### Alignment Checks
About to make a big decision? Ask Reid to run an alignment check. He'll evaluate it against your telos and tell you where it aligns and where it doesn't.

```bash
echo "I'm thinking about skipping happy hour to finish this architecture doc" | \
  ./scripts/alignment-check.sh -
```

## The Files

### Populated (your voice, your words)
- `MISSION.md` — Why you exist, what you're here to do
- `BELIEFS.md` — What you hold to be true
- `TRAUMAS.md` — Past traumas, for context and healing
- `LEARNED.md` — Lessons from experience

### To Develop (through the rhythm, not a single session)
- `VALUES.md` — What you actually prioritize when it counts
- `GOALS.md` — Personal goals (not business — those are in IMM)
- `CHALLENGES.md` — What you're working through right now
- `STRATEGIES.md` — How you're approaching your goals
- `NARRATIVES.md` — The stories your decisions are telling
- `WRONG.md` — Things you've been wrong about
- `MODELS.md` — How you think the world works

### Optional (add when they feel right)
- `FRAMES.md`, `PREDICTIONS.md`, `PROJECTS.md`, `PROBLEMS.md`
- `BOOKS.md`, `MOVIES.md`, `WISDOM.md`

## What Reid Does With This

Reid has read access to this repo. He uses it to:
- Know when to push you ("Dave, go serve breakfast")
- Know when to back off ("This build actually is the highest value thing")
- Catch patterns you can't see from inside them
- Check decisions against your stated values
- Generate journal prompts that actually matter
- Never share any of this with anyone else. Ever.

## Rules

1. **You own this.** Reid proposes telos updates. You approve or reject.
2. **Raw is sacred.** Captures and journal entries are never edited after writing.
3. **No guilt.** The tracking is a mirror, not a scorecard.
4. **No therapy.** Reid notices patterns. He doesn't diagnose.
5. **Privacy is absolute.** This repo is yours alone.
