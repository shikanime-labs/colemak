<!-- owner: shikanime | zone: internal | purpose: known failure modes and the first-responder fix for each -->

# Troubleshooting

## Editor bindings diverge

**Symptom:** navigation works in Helix but not Neovim/Zed, or vice versa.
**Cause:** a binding edited in one `modules/home/*.nix` but not mirrored.
**Fix:** apply the same NEUI mapping across `helix.nix`, `zed-editor.nix`, and
`neovim.nix`; check `nixos/` and `darwin/` if the binding is OS-level.

## macOS vs NixOS layout mismatch

**Symptom:** console/X11 bindings apply on NixOS but not on Darwin. **Cause:**
change landed in `modules/nixos/*` without a `modules/darwin/*` counterpart.
**Fix:** add the equivalent module under `darwin/` and import it from
`modules/darwin/default.nix`; register via `modules/flake/darwin.nix`.

## `nix fmt` fails on a docs page

**Cause:** treefmt's rumdl-check rejects Markdown lines over 80 columns.
**Fix:** wrap the offending lines to ≤80 and re-run `nix fmt` until clean.

## CI eval failure after a Nix upgrade

**Symptom:** `nix.yaml` breaks with a FOD `narHash` regression on a new Nix.
**Cause:** upstream Nix changed fixed-output derivation hashing. **Fix:** pin CI
Nix to a known-good version (the fleet pins 2.34.8) until the input is
regenerated; see the historical `fix/pin-nix-in-ci` work.
