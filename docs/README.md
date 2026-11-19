<!-- owner: Automata | zone: technical | purpose: Canonical technical index for the Colemak Nix modules repository -->
# Colemak Nix Modules

Nix modules for Colemak keyboard layout configuration, migrated from the
[shikanime dotfiles](https://github.com/shikanime/shikanime). The flake
optimizes modal-editor navigation around the home-row **NEUI** cluster —
`n` left, `e` down, `u` up, `i` right — so the four most frequent motions avoid
the `HJKL` cluster that Colemak displaces. Displaced commands are restored
(`h` = insert, `l` = undo), and Helix, Zed (via Helix-mode emulation) and
Neovim share equivalent normal/select bindings.

## Canonical sources

- [Repository README](https://github.com/shikanime-labs/colemak#readme)
- [Technical wiki](https://github.com/shikanime-labs/colemak/wiki)

## Flake outputs and modules

`flake.nix` is flake-parts based with devenv, devlib, git-hooks and treefmt-nix
inputs plus four Cachix substituters. It exports `homeModules.default` (the
umbrella `colemak.enable` switch) and per-editor modules `homeModules.helix`,
`homeModules.zed-editor` and `homeModules.neovim`. Module sources live under
`modules/`:

- `modules/home/` — editor modules (`colemak.nix`, `helix.nix`,
  `neovim.nix`, `zed-editor.nix`, `wayland.nix`) and the Home Manager umbrella.
- `modules/nixos/` — console/xserver keymap support and the NixOS umbrella.
- `modules/darwin/` — macOS system keymap and the Darwin umbrella.
- `modules/flake/` — per-system flake wiring for nixos, home and darwin.

## Usage

Import `inputs.colemak.homeModules.default` into Home Manager and set
`colemak.enable = true`, or enable one editor, e.g.
`colemak.neovim.enable = true`.

## Maintenance

Renovate (`.github/renovate.json`) extends `config:best-practices` and
`security:openssf-scorecard`, enables the `nix` manager for flake-input PRs,
and runs `nix fmt` once per update branch (`executionMode: branch`, scoped to
`**/*.nix`).

## Documentation rule

In-repo `docs/` is canonical for technical detail. The wiki is a rendered
human index that links here.
