<!-- owner: shikanime | zone: internal | purpose: docs landing + index for the Colemak Nix modules repo -->

# Colemak Nix Modules — Documentation

Nix modules that configure the Colemak keyboard layout and restructure modal
editor keybindings around the home-row **NEUI cluster** (`n`=left, `e`=down,
`u`=up, `i`=right). The repo is a module library consumed by Home Manager and
NixOS configurations across the shikanime fleet; it ships no running service.

## Internal ops

- [Architecture](./Architecture.md) — module tree, the NEUI design, and how
  editor modules stay in parity.
- [Development](./Development.md) — local setup, the build/format loop, and how
  to add an editor module.
- [Runbook](./Runbook.md) — how to consume, bump, and release the flake.
- [Troubleshooting](./Troubleshooting.md) — parity drift, platform mismatches,
  and CI pinning regressions.
- [Reference](./Reference.md) — option namespace and exposed module attributes.

## User-facing docs

The user guide lives in the repo [README](./../README.md) (install, per-editor
enable, license). It is the canonical source for consumers; this `docs/`
directory owns internal ops only and links out rather than duplicating it.
