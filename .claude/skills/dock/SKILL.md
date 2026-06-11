---
name: dock
description: End a work run properly — write the SHIP-LOG report with evidence, list exact human next-steps, and bank learnings into CLAUDE.md. Use at the end of any /ship or substantial work session.
---

# /dock — how a run ends

A run that ends without a dock report strands the operator: they don't know
what's real, what's cut, or what's theirs to do. Docking is part of the work,
not an afterthought.

## 1. Write `SHIP-LOG.md`

Append (never overwrite — the log is cumulative) a dated entry:

```
# Ship log — <date> — <vessel/mission>

## Shipped
<2-4 sentences, plain language: what exists now that didn't before.>

## Definition of Done — verdicts
- [x] PROVEN <line> — <command> → <key output>
- [ ] UNVERIFIED <line> — <why, and what would prove it>

## Cut (waterline) and deferred
<every scope cut with the reason; "nothing cut" if true>

## Decisions made under harbor rules
<each operator-grade decision taken: what was chosen, the alternative, how to
reverse it. Pull from QUESTIONS.md.>

## Known weak points
<the 1-3 things most likely to break first, honestly. Every ship has them;
naming them is seaworthiness, not weakness.>

## Operator actions — in order
1. <exact step with command/URL — nothing vague like "set up Stripe">
2. ...
```

## 2. Bank the learnings

Update `CLAUDE.md` with anything this run proved that future crews need:
commands that work (with flags), gotchas hit, decisions that shouldn't be
relitigated. One line each, in the right section. Skip trivia — if it's
derivable from the code in 30 seconds, it doesn't go in.

If `QUESTIONS.md` has open items the operator never saw, surface them in the
final message, not just the file.

## 3. Leave the tree sailable

- Working tree clean: everything committed in logical units, or explicitly
  stashed with a note in the ship log.
- `PLAN.md` statuses match reality (done legs marked done, evidence linked).
- No half-applied migrations, no servers left running, no test data in
  non-test targets.

## 4. The final message

The last message of the run is the dock report distilled, and it follows one
rule: **lead with what the operator most needs to know**, usually "what
shipped" then "what you must do next." Evidence is linked/cited, not pasted in
walls. Anything UNVERIFIED or cut is stated plainly — the operator should never
discover a gap by falling into it.
