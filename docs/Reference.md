<!-- owner: shikanime | zone: internal | purpose: the option namespace and exposed module attributes for consumers -->

# Reference

## Option namespace (`colemak.*`)

Set under a Home Manager or NixOS config after importing
`inputs.colemak.homeModules.default`.

| Option                      | Type | Effect                                      |
| --------------------------- | ---- | ------------------------------------------- |
| `colemak.enable`            | bool | Enable all editor modules at once.          |
| `colemak.neovim.enable`     | bool | Neovim NEUI cluster + restored `HJKL`.      |
| `colemak.helix.enable`      | bool | Helix NEUI cluster + restored `HJKL`.       |
| `colemak.zed-editor.enable` | bool | Zed Helix-mode emulation with NEUI cluster. |

OS-level modules (`modules/nixos/*`, `modules/darwin/*`) apply the layout at the
console / X11 / Wayland / greeter layer and are enabled through their own
import, not the `colemak.*` home switches.

## Exposed flake modules

| Attribute                | Target       | Source                        |
| ------------------------ | ------------ | ----------------------------- |
| `homeModules.default`    | Home Manager | `modules/default.nix`         |
| `homeModules.helix`      | Home Manager | `modules/home/helix.nix`      |
| `homeModules.neovim`     | Home Manager | `modules/home/neovim.nix`     |
| `homeModules.zed-editor` | Home Manager | `modules/home/zed-editor.nix` |
| `nixosModules.*`         | NixOS        | `modules/nixos/*.nix`         |
| `darwinModules.*`        | nix-darwin   | `modules/darwin/*.nix`        |

## Keybindings (NEUI cluster)

| Key | Action            |
| --- | ----------------- |
| `n` | left              |
| `e` | down              |
| `u` | up                |
| `i` | right             |
| `h` | insert (restored) |
| `l` | undo (restored)   |
