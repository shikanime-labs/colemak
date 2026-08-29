<!-- owner: shikanime | zone: internal | purpose: the local build/format loop and how to extend the module set -->

# Development

## Prerequisites

- A recent Nix with flakes enabled.
- `direnv` (the repo ships `.envrc`); `direnv allow` to load the dev shell.
- This is a `jj` repo. Branch off `main`; never commit to `main` directly.

## Build and check loop

```bash
nix fmt                      # treefmt: Nix formatting + markdown lint (80-col)
nix build .#checks            # run the flake's evaluation/check pass
```

CI (`.github/workflows/`) runs `nix.yaml` (evaluation + formatting) on every PR,
plus `renovate` for flake input bumps and `triage` for issue routing. `nix fmt`
must be clean before a PR is reviewable.

## Commit style

Plain capitalized title, no conventional-commit prefix. Body uses labels:

```text
Design: <why the binding changed>
Related: <full URL to issue/PR>
Closes: <full URL>
```

Keep Markdown wrapped at 80 columns. (The `manifests` repo additionally requires
`Signed-off-by`; this repo does not.)

## Adding an editor module

1. Add `modules/home/<editor>.nix` implementing the NEUI cluster and restored
   `HJKL` mappings for that editor.
2. Import it from `modules/home/default.nix` and expose
   `colemak.<editor>.enable`.
3. Mirror the bindings in `helix.nix` / `zed-editor.nix` / `neovim.nix` and the
   OS modules if the binding has a system-level effect.
4. Document the new switch in `README.md` (Usage) and `Reference.md`.
5. `nix fmt` and open a PR against `main`.
