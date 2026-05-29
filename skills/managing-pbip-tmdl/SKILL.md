---
name: managing-pbip-tmdl
description: Use when organizing PBIP projects, editing TMDL files, planning safe refactors across report and model files, or understanding Power BI project structure and rename impact.
---

# Managing PBIP and TMDL

## Overview

PBIP makes Power BI source-controllable, but text-level edits are cross-cutting. Treat changes as project changes, not single-file edits.

## Folder map

| Path area | Purpose |
| --- | --- |
| `*.SemanticModel/definition/` | model metadata, tables, relationships, expressions, roles |
| `*.Report/definition/` | report pages, visuals, report settings |
| `definition.pbir` | report-to-model binding |
| `StaticResources/RegisteredResources/` | themes and shared assets |

## Safe edit workflow

1. Determine whether the report is `byPath` or `byConnection`.
2. Decide whether the change belongs in the model, the report, or both.
3. For renames, search across tables, relationships, report bindings, and DAX query files before editing.
4. Keep encoding and line endings consistent.
5. Reopen Power BI Desktop after external edits; it does not reliably pick up changes live.

## TMDL rules that matter most

- indentation is semantic; stay consistent
- `///` is for descriptions on the object that follows
- quote names only when needed
- avoid direct text edits for risky changes if a safer tool is available

## Refactor checklist

- old name removed from TMDL references
- report bindings still point to the intended model
- thin versus thick report assumptions are still valid
- theme and report assets still resolve

## Common mistakes

- editing a single table and forgetting downstream references
- assuming valid JSON or valid text means a report will render
- changing model names without checking report connection metadata
- mixing quick fixes and structural refactors in one pass
