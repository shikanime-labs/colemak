{ config, lib, ... }:

with lib;

let
  cfg = config.colemak.xserver;
in
{
  options.colemak.xserver.enable = mkOption {
    type = types.bool;
    default = config.colemak.enable;
    description = "Enable Colemak keyboard layout for X11 (GUI).";
  };

  config = mkIf cfg.enable {
    # X11 keyboard layout: Colemak.
    services.xserver = {
      xkb.layout = "us";
      xkb.variant = "colemak";
    };
  };
}
