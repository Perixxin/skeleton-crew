---
name: verify
description: Evidence-based verification of work against a Definition of Done — actually run the thing, observe real behavior, record proof. Use after building, before claiming anything is done, or when asked to check that something works.
---

# /verify — evidence or it didn't happen

Verification means observing the actual behavior, not re-reading the code and
concluding it looks right. Code review is not verification.

## Procedure

1. **Collect the claims.** From `SHIP-ORDER.md`'s Definition of Done (or the
   user's request if no order exists), list every claim as a checkbox. Each claim
   must be phrased as an observable: "POST /api/checkout returns a Stripe URL",
   not "checkout works".

2. **Choose the strongest available proof for each claim**, in this order:
   a. The real user path (run the app, click the flow, screenshot it)
   b. An end-to-end command (`curl` the route, run the CLI, run the migration
      against a scratch db)
   c. The test suite (run it; paste the summary line, not the wall)
   d. Static checks (typecheck/build) — weakest; alone they prove only compilation

3. **Run the proofs.** Real commands, real output. Trim output to the lines that
   carry the verdict, but never edit them. If a proof needs state (seed data, env
   var, running server), set it up — "couldn't easily test" is not a verdict.

4. **Record verdicts** in `SHIP-LOG.md` (create if absent):

   ```
   ## Verification — <date>
   - [x] PROVEN  <claim> — `<command>` → <key output line>
   - [ ] FAILED  <claim> — <what happened> → <fix applied / blocking issue>
   - [ ] UNVERIFIED <claim> — <exactly why it cannot be tested here, what would prove it>
   ```

5. **FAILED items get fixed and re-proven now** — verification that ends with
   known failures and no fixes is a bug report, not a verification.

## Rules

- One UNVERIFIED line with an honest reason beats five optimistic PROVENs. The
  operator makes launch decisions from this log; lying to it is sinking the ship.
- Proof commands must be re-runnable: record them exactly, including env setup,
  so the operator can replay any verdict.
- If a proof requires something outward-facing or irreversible (real payment,
  real email, prod deploy), mark it UNVERIFIED with the test-mode equivalent
  proven instead. Never fire real ordnance to prove a drill.
- After any fix, re-run the proof for every claim the fix could plausibly have
  disturbed, not just the one that failed.
