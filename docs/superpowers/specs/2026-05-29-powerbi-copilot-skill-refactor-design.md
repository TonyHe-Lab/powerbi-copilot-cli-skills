# Power BI Copilot Skill Refactor Design

## Goal

Create a GitHub Copilot CLI reusable skill project that captures the highest-value Power BI workflows from the upstream marketplace without carrying over its full multi-plugin complexity.

## Problem

The upstream marketplace is broad, fast-moving, and intentionally modular. That is useful for exploration, but less useful when one person repeatedly needs a stable Copilot CLI setup for:

- semantic modeling
- DAX authoring and debugging
- Power Query authoring
- report page design
- PBIP and TMDL file management

The refactor should reduce cognitive load, keep the plugin install surface small, and preserve the most transferable practices.

## Source analysis

### Upstream strengths

- rich domain knowledge for Power BI and Fabric
- practical file-format and modeling guidance
- strong warnings around brittle areas like PBIR and TMDL
- good coverage of DAX, modeling, and report design review

### Upstream friction for this use case

- split across several child plugins
- some skill metadata is optimized for upstream marketplace conventions rather than this focused package
- many instructions assume extra tooling, hooks, or broader repo context
- much more breadth than needed for a focused daily Copilot workflow

## Chosen architecture

Use one plugin root with five curated skills:

1. `modeling-semantic-models`
2. `writing-dax`
3. `authoring-power-query`
4. `designing-power-bi-reports`
5. `managing-pbip-tmdl`

## Why one plugin

- easier to publish and install
- fewer moving parts than a marketplace
- skill discovery stays simple
- matches the user's request for a reusable Copilot CLI skill set, not a large catalog

## Content transformation rules

1. Keep only `name` and `description` in skill frontmatter.
2. Rewrite descriptions so they begin with `Use when...`.
3. Replace product-specific or harness-specific instructions with Copilot-neutral guidance.
4. Keep the skills concise and practical rather than copying every upstream reference.
5. Preserve upstream attribution and GPL obligations.

## File layout

```text
powerbi-copilot-cli-skills/
|-- .claude-plugin/plugin.json
|-- README.md
|-- ATTRIBUTION.md
|-- LICENSE
|-- skills/
|   |-- modeling-semantic-models/SKILL.md
|   |-- writing-dax/SKILL.md
|   |-- authoring-power-query/SKILL.md
|   |-- designing-power-bi-reports/SKILL.md
|   `-- managing-pbip-tmdl/SKILL.md
|-- docs/superpowers/specs/
|-- docs/superpowers/plans/
|-- tests/validate-plugin.ps1
`-- memory-bank/
```

## Non-goals

- porting all upstream plugins
- porting hooks, agents, or Fabric admin workflows
- reproducing every upstream reference file
- building a marketplace unless a later phase requires it

## Validation approach

- verify plugin manifest parses
- verify the expected five skills exist
- verify every skill uses only `name` and `description` frontmatter
- verify design, plan, attribution, and memory-bank files exist
