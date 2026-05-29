---
name: writing-dax
description: Use when writing or fixing Power BI DAX measures, debugging filter context, choosing between common DAX patterns, or improving slow and confusing calculations.
---

# Writing DAX

## Overview

Solve correctness first, then optimize. Most bad DAX comes from unclear business intent, not missing syntax.

## Working pattern

1. Write the business sentence first: "measure should return X for Y grain."
2. Start from a base aggregation.
3. Add `CALCULATE` only when you need to change filter context.
4. Prefer variables for repeated logic and readable debugging.
5. Optimize only after the measure returns the right result in a simple test slice.

## Quick reference

| Need | Preferred pattern |
| --- | --- |
| safe division | `DIVIDE(a, b)` |
| branch on blanks | `COALESCE()` or explicit blank handling |
| preserve existing filters | `KEEPFILTERS()` |
| remove filters | `REMOVEFILTERS()` |
| iterate only when row-by-row logic is necessary | `SUMX`, `AVERAGEX`, `COUNTX` |
| readability | `VAR ... RETURN ...` |

## Guardrails

- Prefer column filters in `CALCULATE` over filtering whole tables unless the table expression is truly required.
- Avoid `FORMAT()` inside core numeric measures; it turns numbers into text and hurts reuse.
- Use iterators only when a simple aggregator cannot express the logic.
- Be explicit about date context; many "wrong" time measures are really date-table problems.

## Debug checklist

- check the current filter context
- test the base aggregation without modifiers
- test each variable separately
- verify blank behavior and zero behavior separately
- look for duplicated logic that should be a base measure

## Common mistakes

- one giant measure with no variables
- using DAX to repair a poor model
- mixing display formatting with numeric logic
- optimizing before proving correctness
