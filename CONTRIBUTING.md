# Contributing

Thanks for your interest. This repository is the public Claude plugin for the
SecuLynx diagnostic. The diagnostic service itself (scanner, scoring, reports)
runs on SecuLynx servers and is not part of this repository.

## Branches

| Branch | Role | Who writes to it |
| --- | --- | --- |
| `main` | Released state. Claude Code installs the plugin from here. | Pull requests from `dev` only, after checks pass |
| `dev` | Integration branch, where work happens | Direct pushes by maintainers, or pull requests |

`main` is protected: no direct pushes, no force pushes, no deletion, and the
`validate` check must pass before a merge.

## Workflow

```sh
git checkout dev && git pull
# ... edit ...
claude plugin validate . --strict
git commit -am "skill: clarify the verification step"
git push
```

When `dev` is ready to ship, open a pull request from `dev` to `main`. Once it
is merged, tag the release on `main`:

```sh
git checkout main && git pull
git tag v1.0.1 && git push origin v1.0.1
```

The `Release` workflow checks that the tag matches the version in
`.claude-plugin/plugin.json`, builds the Claude.ai skill zip and publishes the
GitHub release with the matching `CHANGELOG.md` section.

## Versions

[Semantic Versioning](https://semver.org/). Bump the version in
`.claude-plugin/plugin.json` and add a `CHANGELOG.md` entry in the same pull
request as the change: Claude Code keeps users on the version they installed
until that field changes.

## Writing style

User-facing text exists in English and French (`README.md`, `README.fr.md`).
Keep both in step. Plain words, no jargon, no em-dashes.

## Security issues

Do not open a public issue. See [SECURITY.md](SECURITY.md).
