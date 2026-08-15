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

## Stack

- 1 commit == 1 PR via ghstack (1 commit is 1 logical atomic change)
- The commit title **is** the PR title; the commit body **is** the PR body
- Split work into stacked PRs to keep each PR small and reviewable
- To pull down an existing stack: `ghstack checkout <PR_NUMBER>`
- To update a PR: edit files, then `jj squash` (or `git commit --amend`) into the
  **target commit** of the stack — the one that PR represents; the commit message
  updates the PR title and body automatically when resubmitted
- Resubmit with `ghstack` after squashing
- `ghstack land` on the head PR to land the entire stack
- Never `gh pr merge` (creates poisoned commits)
- Never force-push ghstack branches


## Protect `main`

- Require 1 approving review
- Require linear history (no merge commits)
- Require signed commits
- Squash+rebase merge only

*Licensed under Apache-2.0. Maintain cross-platform parity when adding new
keybindings. Always use worktrees when making changes.*
