# Colemak

Nix modules for Colemak keyboard layout configurations, migrated from the
Shikanime dotfiles. Optimizes modal editor keybindings for the ergonomic NEUI
cluster on the home row.

**Language:** Nix

## Structure

- `modules/helix.nix` — Helix editor Colemak configuration
- `modules/zed-editor.nix` — Zed editor Helix-mode emulation
- `modules/neovim.nix` — Neovim Colemak configuration
- `flake.nix` — Nix flake exposing all modules

## Layout

Optimized for the ergonomic NEUI cluster on the home row. Maintains consistency
across Helix, Zed (Helix mode), and Neovim.

## Commit Style

- Plain-text capitalized title, no conventional-commit prefix
- Body with labels: `Design:`, `Related:`, `Closes #`
- Keep Markdown lines wrapped at 80 columns and run `nix fmt` before shipping

## Stack Workflow

- Install the official GitHub extension once: `gh extension install github/gh-stack`
  (requires GitHub CLI ≥ 2.0; `gh stack` is in public preview and may change).
- Keep one logical change per PR; split large work into a stack of PRs.
- Create a stack: `gh stack init`, then `gh stack add` for each new branch, and
  commit on the active branch. `gh stack view` lists the stack.
- Submit/update: `gh stack submit` (add `--open` to open PRs, `--auto` to skip
  prompts). Resubmit after each change to refresh titles, bodies, and branches.
- Pull down an existing stack: `gh stack checkout <PR_NUMBER>` (also accepts a
  stack number, PR URL, or branch name).
- Rebase onto updated trunk: `gh stack rebase` (cascading), then `gh stack submit`.
- Land a stack: `gh stack merge` (interactive) or
  `gh stack merge <PR_NUMBER> --yes --squash` to merge up to a PR.
- Never `gh pr merge` on a stacked PR — only `gh stack merge` lands stacks.
- Never force-push stack branches; `gh stack` owns the branch pointers.


## Protect `main`

- Require 1 approving review
- Require linear history (no merge commits)
- Require signed commits
- Squash+rebase merge only

*Licensed under Apache-2.0. Maintain cross-platform parity when adding new
keybindings. Always use worktrees when making changes.*
