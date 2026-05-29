# Power BI Copilot CLI Skills

Focused GitHub Copilot CLI plugin for the parts of `data-goblin/power-bi-agentic-development` that are most useful for day-to-day Power BI work: semantic modeling, DAX, Power Query, report design, and PBIP/TMDL management.

Published repository: `https://github.com/TonyHe-Lab/powerbi-copilot-cli-skills`

## Why this refactor exists

The upstream marketplace is broad and strong, but it is optimized as a multi-plugin collection. This project narrows that scope into a single Copilot-friendly plugin with:

- fewer entry points
- Copilot-oriented skill metadata
- less Claude-specific wording
- a cleaner learning surface for repeated Power BI analysis work

The project keeps the upstream plugin directory shape so it stays close to the source layout already used across agentic CLI ecosystems.

## Included skills

| Skill | Use for |
| --- | --- |
| `modeling-semantic-models` | semantic model structure, star schema, naming, relationships, review |
| `writing-dax` | measure logic, filter context, debugging, common performance fixes |
| `authoring-power-query` | M authoring, folding, import shaping, partition-step debugging |
| `designing-power-bi-reports` | page layout, KPI hierarchy, themes, accessibility, visual hygiene |
| `managing-pbip-tmdl` | PBIP structure, TMDL rules, safe refactors, cross-file rename awareness |

## Source mapping

| This project | Primary upstream sources |
| --- | --- |
| `modeling-semantic-models` | `review-semantic-model`, `standardize-naming-conventions` |
| `writing-dax` | `dax`, parts of `connect-pbid` |
| `authoring-power-query` | `power-query` |
| `designing-power-bi-reports` | `pbi-report-design`, `review-report`, `modifying-theme-json` |
| `managing-pbip-tmdl` | `pbip`, `tmdl`, selected PBIR guidance |

## Design principles

1. Prefer concise guidance over encyclopedic reference.
2. Keep frontmatter Copilot-friendly: `name` and `description` only.
3. Separate business guidance from tool-specific automation.
4. Keep cross-skill boundaries obvious so Copilot can load the right skill quickly.
5. Preserve upstream attribution and GPL licensing.

## Publishing and use

This folder is shaped as a plugin root. To reuse it in GitHub Copilot CLI, install it from:

`https://github.com/TonyHe-Lab/powerbi-copilot-cli-skills`

In Copilot CLI:

```text
/plugin install TonyHe-Lab/powerbi-copilot-cli-skills
```

Then verify:

```text
/plugin list
/skills info writing-dax
```

If the new skills do not appear in the current session immediately, start a new Copilot CLI session once. In validation, the plugin installed successfully right away, and the skills became visible in the next fresh session.

Useful checks once published:

```text
/plugin list
/skills list
/skills info writing-dax
```

## Local validation

Run:

```powershell
pwsh -File .\tests\validate-plugin.ps1
```

## License

This refactor is derived from GPL-3.0-licensed upstream material. See `ATTRIBUTION.md` and `LICENSE`.
