#!/usr/bin/env bash
# Skeleton Crew — quality gate (PostToolUse on Edit|Write)
# Typechecks and lints after every code edit. Exit 2 feeds failures back to the
# agent so it fixes the cause immediately instead of discovering it at build time.
# Designed to never break non-JS/TS projects: unknown situation => silent exit 0.

INPUT="$(cat)"

# --- extract tool_input.file_path (jq if present, else node, else give up quietly)
if command -v jq >/dev/null 2>&1; then
  FILE="$(printf '%s' "$INPUT" | jq -r '.tool_input.file_path // empty' 2>/dev/null)"
elif command -v node >/dev/null 2>&1; then
  FILE="$(printf '%s' "$INPUT" | node -e 'let d="";process.stdin.on("data",c=>d+=c).on("end",()=>{try{process.stdout.write(JSON.parse(d).tool_input?.file_path??"")}catch{}})' 2>/dev/null)"
else
  exit 0
fi

[ -z "$FILE" ] && exit 0
case "$FILE" in
  *node_modules*|*.min.js) exit 0 ;;
  *.ts|*.tsx|*.js|*.jsx|*.mjs|*.cjs) : ;;
  *) exit 0 ;;
esac

# Locate the project root (nearest package.json upward from the file)
DIR="$(dirname "$FILE")"
ROOT=""
while [ "$DIR" != "/" ] && [ -n "$DIR" ]; do
  if [ -f "$DIR/package.json" ]; then ROOT="$DIR"; break; fi
  DIR="$(dirname "$DIR")"
done
[ -z "$ROOT" ] && exit 0

FAILURES=""

# --- typecheck (only if the project has TypeScript wired up)
if [ -f "$ROOT/tsconfig.json" ]; then
  TSC_OUT="$(cd "$ROOT" && npx --no-install tsc --noEmit 2>&1)"
  if [ $? -ne 0 ] && [ -n "$TSC_OUT" ]; then
    FAILURES="TYPECHECK FAILED:
$(printf '%s' "$TSC_OUT" | head -30)"
  fi
fi

# --- lint the edited file (only if eslint is installed locally)
if [ -e "$ROOT/node_modules/.bin/eslint" ]; then
  LINT_OUT="$(cd "$ROOT" && npx --no-install eslint --no-warn-ignored "$FILE" 2>&1)"
  if [ $? -ne 0 ] && [ -n "$LINT_OUT" ]; then
    FAILURES="$FAILURES

LINT FAILED for $FILE:
$(printf '%s' "$LINT_OUT" | head -20)"
  fi
fi

if [ -n "$FAILURES" ]; then
  printf 'Quality gate caught problems after editing %s — fix the cause now (do not weaken the gate):\n%s\n' "$FILE" "$FAILURES" >&2
  exit 2  # PostToolUse: non-blocking, but stderr goes straight back to the agent
fi
exit 0
