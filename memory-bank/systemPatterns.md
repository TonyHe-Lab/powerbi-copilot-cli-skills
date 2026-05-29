# System Patterns

## Project structure

- one plugin manifest in `.claude-plugin/plugin.json`
- one skill per folder under `skills/`
- supporting docs under `docs/superpowers/`
- validation under `tests/`
- project state tracked in `memory-bank/`

## Content pattern

Each skill follows the same shape:

1. YAML frontmatter with `name` and `description`
2. short overview
3. when-to-use framing
4. quick reference or workflow
5. common mistakes and guardrails

## Adaptation pattern

Take upstream domain guidance, trim tool-specific clutter, keep the portable decision-making rules.
