{ config, lib, ... }:

with lib;

let
  cfg = config.colemak.wayland;
in
{
  options.colemak.wayland.enable = mkOption {
    type = types.bool;
    default = config.colemak.enable;
    description = "Enable Colemak keyboard layout for Wayland compositors (via xkbcommon input).";
  };

  config = mkIf cfg.enable {
    # Wayland keyboard layout: Colemak (via xkbcommon input configuration).
    environment.sessionVariables = {
      XKB_DEFAULT_LAYOUT = "us";
      XKB_DEFAULT_VARIANT = "colemak";
    };
  };
}
