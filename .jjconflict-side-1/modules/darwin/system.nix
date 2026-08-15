{ config, lib, ... }:

with lib;

let
  cfg = config.colemak.darwin;
in
{
  options.colemak.darwin.enable = mkOption {
    type = types.bool;
    default = config.colemak.enable;
    description = "Enable Colemak keyboard layout for Darwin (macOS) GUI.";
  };

  config = mkIf cfg.enable {
    # Colemak keyboard layout for macOS via Nix Darwin's NSGlobalDomain.
    # Requires logout/relogin or reboot to take full effect.
    system.defaults.NSGlobalDomain.AppleKeyboardLayout = "com.apple.keylayout.ColemakUS";
  };
}
