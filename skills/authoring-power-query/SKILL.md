---
name: authoring-power-query
description: Use when authoring or fixing Power Query M, shaping import data, preserving query folding, debugging partition expressions, or deciding which transformations belong upstream.
---

# Authoring Power Query

## Overview

Write Power Query with folding in mind. Push cheap, source-friendly work early and delay custom logic until after the foldable steps.

## Working pattern

1. Connect to the source.
2. Remove unused columns early.
3. Filter rows early.
4. Apply clear data types.
5. Join and enrich only after the shape is stable.
6. Add custom row logic late.

## Folding guidance

| Step type | Typical outcome |
| --- | --- |
| column pruning | usually folds well |
| row filtering | usually folds well |
| sorting and grouping | often folds if the source supports it |
| custom columns with complex `each` logic | often breaks folding |
| `Table.Buffer` | forces materialization; avoid unless you really need it |

## Quality rules

- prefer descriptive step names over `Custom1` or `Step2`
- parameterize connection values instead of hardcoding environment details
- keep import logic readable enough to debug one step at a time
- move heavy business logic upstream if Power Query starts acting like a semantic layer

## Debug checklist

- inspect the last step that still folds
- preview row counts before and after major filters
- check data types before joins and merges
- test intermediate steps by temporarily returning them in the `in` clause

## Common mistakes

- adding custom columns before pruning and filtering
- ignoring type mismatches until refresh time
- using Power Query to patch naming and modeling issues that belong in the model
- treating a working refresh as proof that the query is efficient
