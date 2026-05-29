---
name: modeling-semantic-models
description: Use when designing or reviewing Power BI semantic models, star schemas, relationship direction, naming, measure organization, or model quality before report changes.
---

# Modeling Semantic Models

## Overview

Design the model before polishing visuals. A clear semantic model makes DAX simpler, reports thinner, and Copilot prompts more reliable.

## When to Use

- new model or major refactor
- unclear fact and dimension boundaries
- too many bidirectional relationships
- measures scattered across business tables
- naming is technical instead of business-facing

Do not use this skill for detailed DAX syntax work; use `writing-dax`.

## Review order

1. Confirm the business grain for each fact table.
2. Separate facts from dimensions; prefer a star over snowflakes.
3. Check relationship direction and cardinality before adding calculations.
4. Keep explicit measures in dedicated measure tables or clear display folders.
5. Hide technical keys and helper columns from report authors unless they are intentional.
6. Apply business-readable names consistently across tables, columns, and measures.

## Quick reference

| Topic | Preferred default |
| --- | --- |
| Fact tables | one business process per fact when possible |
| Dimensions | descriptive, reusable, conformed where practical |
| Relationships | single direction unless a real ambiguity-free reason exists |
| Measures | explicit measures over implicit aggregation |
| Naming | business language, not source-system abbreviations |
| Dates | one proper date table for time intelligence |

## Common mistakes

- modeling for a single visual instead of for repeated reuse
- keeping wide denormalized tables because they feel easier at first
- using calculated columns where a measure or upstream transform is better
- leaving orphan tables and inactive relationships unexplained
- mixing business terms and source-system names in the same model

## Minimum quality bar

- model answers a business process cleanly
- relationships are explainable without hand-waving
- measures have obvious ownership and naming
- hidden technical clutter stays out of report-author view
