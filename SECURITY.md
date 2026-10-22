# Security policy

SecuLynx is a cybersecurity company, and we take reports about our own
products seriously.

## Scope

- This repository: the Claude plugin manifests and the diagnostic skill.
- The diagnostic service it connects to: `https://diagnostic.seculynx.com/mcp/`
  and the report download links it issues.

Out of scope: denial of service and volumetric testing, social engineering,
and findings on third-party services (Claude, GitHub, Cloudflare).

## Reporting a vulnerability

Please report privately, never in a public issue:

- **GitHub**: use **Report a vulnerability** on the
  [Security tab](https://github.com/seculynx/claude-kit/security) of this
  repository (private vulnerability reporting).
- **Email**: hello@seculynx.com, subject starting with `[security]`.

Include what you found, how to reproduce it, and the impact you see. Test only
against domains you own, and stop as soon as you have shown the issue.

## What to expect

- Acknowledgement within 3 working days.
- A first assessment within 10 working days.
- We keep you informed until the fix ships, and credit you in the release
  notes if you wish.

We will not take legal action against research done in good faith within this
policy.

## Supported versions

Only the latest release on `main` is supported.
