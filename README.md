# SecuLynx for Claude

Run the free **SecuLynx cybersecurity diagnostic** from Claude and get two PDF
reports at the end of the conversation.

*Version française : [README.fr.md](README.fr.md)*

## What it does

Claude guides you through the same diagnostic as
[seculynx.com/en/diagnostic](https://seculynx.com/en/diagnostic/):

1. **A passive scan of your domain**: DNS, email authentication (SPF, DKIM,
   DMARC), TLS, web security headers, exposed files, leaked credentials,
   lookalike domains, reputation. Public information only, the same things
   anyone on the Internet can see. No intrusion, no port scan, no login attempt.
2. **Six short business scenarios** (a lost phone, a fake invoice, ransomware...)
   mapped to the four pillars of the Lynx Security Framework: Understand,
   Protect, Detect, React.
3. **Two reports to download**:
   - a **management report** (4 to 5 pages) a CEO can forward to a board or an
     investor, without technical jargon;
   - a **technical report** for your IT team or provider, with every check, its
     evidence and its recommendation.

The reports are rendered by SecuLynx from the same engine as the website, so
they are identical to the ones you would get there.

## Install

### Claude.ai and Claude Desktop (any plan, including Free)

1. Open **Customize > Connectors**, click **+ Add**, then **Add custom connector**.
2. Name: `SecuLynx`. URL: `https://diagnostic.seculynx.com/mcp/`
3. Authentication: **No sign in**. Click **Add**.
4. In a chat, turn it on with **+ > Connectors**, then ask:
   *"Run the SecuLynx diagnostic on my company's domain."*

For the guided flow, also upload the skill (needs **Settings > Capabilities >
Code execution and file creation** turned on): download
[`seculynx-diagnostic-skill.zip`](https://github.com/seculynx/claude-kit/releases/latest),
then **Customize > Skills > + > Create skill > Upload a skill**.

On Team and Enterprise plans, an owner adds the connector once under
**Organization settings > Connectors** (**Add > Custom > Web**), and members
click **Connect** in **Customize > Connectors**.

### Claude Code

```
/plugin marketplace add seculynx/claude-kit
/plugin install seculynx@seculynx
/reload-plugins
```

Then run `/seculynx:diagnostic`, or simply ask for a security diagnostic.
Update later with `/plugin marketplace update seculynx`.

## What you need

- the **domain** to assess: your own organisation's, the same domain as your
  email (`jane@acme.fr` can assess `acme.fr` or `shop.acme.fr`). To assess a
  client's domain, [contact us](https://seculynx.com/en/contact/);
- your **work email** (free webmail addresses are not accepted). SecuLynx
  emails it a 6-digit code: no scan runs until you enter it in Claude. A
  SecuLynx expert may contact you about the results. See the
  [privacy policy](https://seculynx.com/en/privacy/);
- about five minutes.

Limits: a few diagnostics per email and per domain per day. Report links and
files are deleted after 30 days.

## What is in this repository

| Path | Purpose |
| --- | --- |
| `.claude-plugin/plugin.json` | Plugin manifest |
| `.claude-plugin/marketplace.json` | Makes this repository installable with `/plugin marketplace add` |
| `.mcp.json` | Connects Claude to the SecuLynx diagnostic server |
| `skills/diagnostic/SKILL.md` | How Claude runs the diagnostic, step by step |

No code runs on your machine: the plugin only tells Claude where the SecuLynx
server is and how to conduct the diagnostic.

## Tools exposed by the server

| Tool | Does |
| --- | --- |
| `get_questionnaire` | The context questions and the six scenarios |
| `start_diagnostic` | Records your contact and emails you a verification code |
| `verify_email` | Checks the code, then starts the passive scan |
| `submit_answers` | Saves your answers, returns one insight per answer |
| `get_scan_results` | Scan progress, then the failing checks, worst first |
| `generate_report` | Renders the two PDF reports |
| `get_report` | Score, maturity, pillar scores and the two download links |

## About SecuLynx

SecuLynx helps SMEs, mid-sized companies and scale-ups manage cyber risk with
senior experts, alongside their internal IT team or provider.
[seculynx.com](https://seculynx.com) · [Contact](https://seculynx.com/en/contact/)

## License

MIT, see [LICENSE](LICENSE). The diagnostic service itself is operated by
SecuLynx and subject to its [terms](https://seculynx.com/en/legal/).
