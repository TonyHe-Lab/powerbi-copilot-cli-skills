# Power BI Copilot Skill Refactor Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a focused Copilot CLI plugin that reuses the most valuable Power BI guidance from the upstream marketplace.

**Architecture:** Create one plugin root with five curated skills, supporting documentation, and a local validation script. Keep the skill bodies concise, remove upstream marketplace-only metadata, and preserve attribution and licensing.

**Tech Stack:** Markdown, JSON, PowerShell, GitHub Copilot CLI plugin conventions

---

### Task 1: Define the plugin shell

**Files:**
- Create: `.claude-plugin/plugin.json`
- Create: `README.md`
- Create: `ATTRIBUTION.md`
- Create: `LICENSE`
- Test: `tests/validate-plugin.ps1`

- [x] **Step 1: Write the failing validation script**
- [x] **Step 2: Run it and confirm missing plugin files fail**
- [x] **Step 3: Add the plugin manifest and top-level docs**
- [x] **Step 4: Re-run validation after the project files exist**

### Task 2: Curate the five skills

**Files:**
- Create: `skills/modeling-semantic-models/SKILL.md`
- Create: `skills/writing-dax/SKILL.md`
- Create: `skills/authoring-power-query/SKILL.md`
- Create: `skills/designing-power-bi-reports/SKILL.md`
- Create: `skills/managing-pbip-tmdl/SKILL.md`
- Test: `tests/validate-plugin.ps1`

- [x] **Step 1: Map each new skill to the upstream source material**
- [x] **Step 2: Rewrite frontmatter to `name` and `description` only**
- [x] **Step 3: Keep each skill concise and role-focused**
- [x] **Step 4: Re-run validation**

### Task 3: Preserve design context

**Files:**
- Create: `docs/superpowers/specs/2026-05-29-powerbi-copilot-skill-refactor-design.md`
- Create: `docs/superpowers/plans/2026-05-29-powerbi-copilot-skill-refactor.md`

- [x] **Step 1: Record the source analysis**
- [x] **Step 2: Record architectural choices and non-goals**
- [x] **Step 3: Record the execution plan**

### Task 4: Initialize the memory bank

**Files:**
- Create: `memory-bank/projectbrief.md`
- Create: `memory-bank/productContext.md`
- Create: `memory-bank/activeContext.md`
- Create: `memory-bank/systemPatterns.md`
- Create: `memory-bank/techContext.md`
- Create: `memory-bank/progress.md`
- Create: `memory-bank/tasks/_index.md`
- Create: `memory-bank/tasks/TASK001-skill-refactor.md`

- [x] **Step 1: Capture project scope**
- [x] **Step 2: Capture the new plugin structure**
- [x] **Step 3: Record progress and open next steps**
