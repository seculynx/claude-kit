#!/usr/bin/env sh
# Build the skill zip for Claude.ai / Claude Desktop (Customize > Skills >
# + > Create skill > Upload a skill). Attach it to a GitHub release as
# seculynx-diagnostic-skill.zip.
#
# In the plugin the skill is "diagnostic", namespaced by Claude Code as
# /seculynx:diagnostic. Uploaded on its own it has no namespace, so it ships as
# "seculynx-diagnostic": folder and frontmatter name must match, or the upload
# is refused.
set -eu
cd "$(dirname "$0")/.."
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$tmp/seculynx-diagnostic" dist
sed 's/^name: diagnostic$/name: seculynx-diagnostic/' skills/diagnostic/SKILL.md > "$tmp/seculynx-diagnostic/SKILL.md"
grep -q '^name: seculynx-diagnostic$' "$tmp/seculynx-diagnostic/SKILL.md"
rm -f dist/seculynx-diagnostic-skill.zip
(cd "$tmp" && zip -qr - seculynx-diagnostic) > dist/seculynx-diagnostic-skill.zip
echo "wrote dist/seculynx-diagnostic-skill.zip"
