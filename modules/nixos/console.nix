{ config, lib, ... }:

with lib;

let
  cfg = config.colemak.console;
in
{
  options.colemak.console.enable = mkOption {
    type = types.bool;
    default = config.colemak.enable;
    description = "Enable Colemak keyboard layout for console (TTY).";
  };

  config = mkIf cfg.enable {
    # Console (TTY) keyboard layout: Colemak.
    console.keyMap = "colemak";
  };
}
