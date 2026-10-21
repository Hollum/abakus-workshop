# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This is a starter repo for a workshop where teams use Claude Code to build a web app for a fictional product. It has no application code yet, so it has no build, lint or test commands. The team chooses the stack. Read what the team has built before you assume one.

- `workshop/PRODUCT_BRIEF.md`: the product the team builds, written by `/generate-product`.
- `workshop/NOTES.md`: the team's reflection sheet, written by `/note`.
- `.claude/commands/`: the workshop commands `/generate-product`, `/talk-with-customer` and `/note`.
- `.agents/skills/`: the skills, installed from mattpocock/skills and pinned in `skills-lock.json`. `.claude/skills/` holds symlinks to them.

PostgreSQL runs in Docker. `README.md` has the setup steps, and `.env.template` has the connection URL (`DATABASE_URL`). The `postgres` MCP server in `.mcp.json` connects to the same database.

Text for the students (the product brief and the notes) is in Norwegian bokmål. Instructions for agents (commands, skills and this file) are in English.

## Issue tracker

The issue tracker is local Markdown files under `.scratch/<feature-slug>/`:

- `/to-spec` writes the spec to `.scratch/<feature-slug>/spec.md`.
- `/to-tickets` writes one file per ticket to `.scratch/<feature-slug>/issues/<NN>-<slug>.md`, with its local ticket template.
- A triage label is the `**Status:**` line of the file. A ticket is ready when the line is `ready-for-agent`. To close a ticket, set the line to `done`.
- To refer to a spec or a ticket, for example in a commit message, use its file path.
