# AGENTS.md

## Working Principles

- Prefer the smallest clear solution that satisfies the request. Follow KISS and
  YAGNI; avoid speculative abstractions and unrelated refactors.
- Do not apply DRY mechanically. Prefer a little duplication when it makes the
  code easier to read and change.
- Preserve existing behavior and conventions unless the task explicitly requires
  changing them.
- Use features supported by the project's declared language and library versions.
  Do not upgrade dependencies or add production dependencies without approval.
- For change, build, or fix requests, make the requested in-scope edits and run
  relevant non-destructive validation without asking first. Ask before destructive
  actions, external writes, or a material expansion of scope.

## Coding and Validation

- Use the project's existing environment, package manager, and commands. For
  Python projects managed by uv, run tools through `uv run`.
- After editing, run the narrowest relevant tests, formatter, linter, and type
  checker available in the project. Report what ran and any checks that could not
  run; do not fix unrelated failures.
- Keep functions cohesive and group code by domain. Extract helpers only when a
  block has a distinct responsibility or has become difficult to understand.
- Separate logical chunks with blank lines, including around non-trivial control
  flow, when it improves readability.

## Python

- Prefer `uv` with `pyproject.toml` for project management. Follow the existing
  project setup when it uses another tool.
- Prefer `ruff` for linting and formatting, `ty` or `pyright` for type checking,
  and `pytest` for tests when the project already provides them.
- Prefer high-level standard-library APIs such as `pathlib` over lower-level
  alternatives when they make the code clearer.
- Reuse existing dependencies. When a new dependency is justified, prefer modern,
  well-maintained libraries such as `httpx`, `polars`, or `orjson` where they fit
  the project's requirements; request approval before adding it.
