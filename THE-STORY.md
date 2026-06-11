# THE STORY — how this kit built itself

Written by the crew, 2026-06-11. Every claim below is checkable against the
repository's git history. Where something wasn't verifiable, it says so —
that's rather the point of the whole kit.

## The order

The repository began as an empty folder named `IDKYET` — "I don't know yet."
The operator opened Claude Code and typed one instruction:

> I need you to go and make me money

The crew asked two clarifying questions (direction; existing assets to
leverage). The operator answered both with, in effect: *you decide
everything.* Full delegation, no further input. So the crew decided.

## The pivot that mattered

The first plan was the obvious one: build a SaaS boilerplate, since those
sell for $149–299. Twenty minutes of market research killed it: the
incumbents at $299 were already marketing "AI-agent optimized" boilerplates,
with years of polish and SEO. An unknown seller does not win that fight on
features.

What an unknown seller has that Supastarter doesn't: this exact session. A
product about autonomous shipping, built autonomously, where the construction
*is* the demo. The crew repositioned: don't sell parts (free repos win on
quantity), sell an enforced process with one spine — ship order in, verified
ship out.

## Building under its own rules

The kit's rules were written first, then obeyed:

- **Evidence or it didn't happen.** The three enforcement hooks were tested
  with 11 cases before being declared done — including scaffolding a real
  throwaway TypeScript project with a deliberate type error, to watch
  `quality-gate.sh` catch `TS2322` and feed it back, then go green on the fix.
  The secret tripwire was proven to block a staged live-style key and to
  allow test keys in env files. The dock guard was proven to block a dirty
  tree exactly once (no loops) and stand down on clean ones.

- **The worked example is a real ship.** The feedback-widget app in
  `example/` was built against its own SHIP-ORDER.md. Its row-level security
  was proven *live*: the migration was applied to a real scratch database,
  then attacked with the real anonymous key over the REST API — insert
  `HTTP 201`, select `[]`, delete survived by the row, oversize message
  rejected by the check constraint. The scratch table was dropped afterwards,
  leaving the database as found.

- **Honesty over green checkmarks.** One line of the example's definition of
  done is marked UNVERIFIED in its SHIP-LOG.md: the magic-link login's
  runtime path, because proving it requires a human inbox. The crew chose to
  ship an honest gap instead of a confident claim. If that bothers you, this
  kit is not for you — that behavior is the product.

## What the human did

Created an empty folder. Typed one sentence. Declined to make decisions.
Will click "publish" on the store listing and paste the launch posts. That's
the experiment: it is exactly the division of labor this kit proposes —
humans hold the mandate, the money, and the outward-facing acts; the crew
holds the process.

(For completeness: the crew also found, in a connected database, the remains
of the operator's previous money-making attempts. Several of them. That story
belongs to the operator. The folder name was honest.)

## What this proves and doesn't

It proves a disciplined agent can take a one-line mandate to a packaged,
tested, honestly-documented product in one session. It does **not** prove the
product will sell — at the time this file was written, revenue was exactly
$0, the launch posts unposted. Whether the loop closes is decided after this
file is frozen into the zip you're reading. If you bought it: it closed at
least once.
