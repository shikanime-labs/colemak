<!-- owner: shikanime | zone: internal | purpose: how to consume, bump, and release the flake without surprises -->

# Runbook

This repo is a library, not a deployable service. "Operations" means keeping the
flake consumable and the fleet's editor bindings coherent.

## Consuming the modules

In a downstream Home Manager / NixOS config:

```nix
imports = [ inputs.colemak.homeModules.default ];
colemak.enable = true;          # or colemak.neovim.enable = true;
```

After a `flake.lock` update that pulls a new `colemak` rev, rebuild the
consuming config and confirm keybindings still resolve (no option removed
upstream).

## Bumping flake inputs

`renovate` opens PRs for input bumps; they run through `nix.yaml` the same as
manual changes. Land bumps on `main` via squash+rebase (see `AGENTS.md`
protection rules).

## Releasing

There is no version tag or publish step — consumers pin a `colemak` rev through
their flake lock. A change is "released" the moment it merges to `main`;
downstream `flake.lock` updates pull it in.

## Branch protection

`main` requires one approving review, linear history, signed commits, and
squash+rebase only. PRs are the merge path; direct pushes are rejected.
