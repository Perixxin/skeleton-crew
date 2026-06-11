# Skeleton Crew ☠️ — free skills

**Your agents ship while you sleep.** Skeleton Crew is an operating system
for autonomous Claude Code work: you write a one-page ship order, the crew
runs an enforced plan → build → verify → review → dock loop, and you get a
ship log with evidence instead of vibes.

It was built by Claude Code, autonomously, in one session that started with
an empty folder named `IDKYET` and the instruction **"make me money."** The
kit shipped itself under its own rules — [THE-STORY.md](THE-STORY.md) is the
honest log, including the things it could *not* verify.

## Free in this repo

| File | What it does |
|---|---|
| `.claude/skills/verify/` | `/verify` — evidence-based verification: run the thing, record real output, verdict per claim (PROVEN / FAILED / UNVERIFIED). The single highest-leverage habit for agent work. |
| `.claude/skills/dock/` | `/dock` — end every session with a ship log: what shipped, the evidence, what was cut, your exact next steps. No more archaeology the morning after. |
| `.claude/hooks/quality-gate.sh` | Typecheck + lint after **every** edit, failures fed straight back to the agent until the cause is fixed. Tested against a real `tsc` error before shipping. |

### Install (1 minute)

```bash
cp -R .claude /path/to/your/project/   # merge if you already have one
chmod +x /path/to/your/project/.claude/hooks/quality-gate.sh
```

Wire the hook in your project's `.claude/settings.json`:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/quality-gate.sh",
            "timeout": 180
          }
        ]
      }
    ]
  }
}
```

Then use `/verify` after any build, and `/dock` before you close the laptop.

## The full kit ($39 launch / $59)

The paid kit is the whole operating system:

- **`/ship`** — the full autonomous loop against a SHIP-ORDER.md contract
- **`/db`** — schema changes with default-deny RLS, proven against scratch
  databases (the worked example's policies were proven live, as a real
  anonymous REST client, before shipping)
- **`/payments`** — Stripe with raw-body webhook verification, replay-proof
  fulfillment, test-mode until *you* flip it
- **`/sell`** — a storefront with automated delivery on your own Stripe:
  payment link, signature-verified webhook, paid-session-gated downloads
  (the kit literally sells itself through this skill's pipeline)
- **`/launch-ops`** — launch-day operations: thread monitoring, replies
  drafted at comment-speed, per-batch-approved email pitches; the human
  stays the only identity that ever posts (that boundary is the strategy)
- **`/feature`, `/launch-assets`, `/ship-check`** — and the templates
- **MODEL-MIXING.md** — budget tier for the grind, strongest tier pinned on
  reviewer/security; enforced gates hold the floor on any model
- **3 crew agents** — adversarial reviewer, security, simplifier
- **2 more enforced hooks** — secrets blocked from files *and* commits;
  a dock guard that won't let a session end with a dirty tree mid-ship
- **The worked example** — a real Next.js 16 + Supabase app with its full
  ship-order → plan → evidence paper trail

**Get it:** https://buy.stripe.com/fZueVd8P77Y04aH7UTf7i00

*(14-day no-questions refunds. License: unlimited projects, just don't resell
the kit itself.)*

## License (this repo)

MIT — see [LICENSE](LICENSE). The free files are genuinely free; use them
anywhere.
