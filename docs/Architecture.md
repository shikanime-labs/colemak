<!-- owner: shikanime | zone: internal | purpose: explain the module tree and NEUI design so changes land in the right file -->

# Architecture

## Goal

Migrated from the shikanime dotfiles, this repo turns ad-hoc Colemak keybinding
hacks into composable Nix modules. The single design constraint is **cross-
platform parity**: the same home-row NEUI cluster must behave identically in
Helix, Zed (via Helix-mode emulation), and Neovim, plus at the OS layer
(console, X11, Wayland) on NixOS and Darwin.

## Module tree

```text
modules/
  default.nix          # umbrella: imports editor modules, exposes colemak.*
  flake/               # glue that registers homeModules / nixosModules / darwinModules
    darwin.nix
    home.nix
    nixos.nix
  home/                # Home Manager modules (per-editor + wayland session vars)
    colemak.nix  helix.nix  neovim.nix  zed-editor.nix  wayland.nix  default.nix
  nixos/               # NixOS modules: console, X11, Wayland, greeter, xserver
    colemak.nix  console.nix  default.nix  greeter.nix  xserver.nix
  darwin/              # macOS modules: system-level layout
    colemak.nix  default.nix  system.nix
```

`modules/default.nix` is the public surface: it imports every editor module and
exposes the shared option namespace under `colemak.*`. The `flake/` tree maps
those into `homeModules`, `nixosModules`, and `darwinModules` so a consumer
imports `inputs.colemak.homeModules.default` and flips `colemak.enable`.

## NEUI design

`HJKL` (an ADM-3A artifact) scatters across rows under Colemak. This repo maps
the four most frequent navigation commands onto the home-row NEUI diamond,
reduces finger travel, and restores displaced `HJKL` to original functions
(`h`=insert, `l`=undo). Minor modes (GoTo, View) preserve NEUI directionality.

## Parity rule

Any change to a navigation binding must be mirrored across `helix.nix`,
`zed-editor.nix`, and `neovim.nix`, and where relevant the OS-level modules in
`nixos/` and `darwin/`. A binding that exists in one editor but not the others
is a bug, not a feature.
