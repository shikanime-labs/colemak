{ config, lib, ... }:

with lib;

let
  cfg = config.colemak.greeter;
in
{
  options.colemak.greeter.enable = mkOption {
    type = types.bool;
    default = config.colemak.enable;
    description = "Enable Colemak keyboard layout for the Noctalia Greeter login screen.";
  };

  config = mkIf (cfg.enable && config.programs.noctalia-greeter.enable) {
    # Greeter (Noctalia Greeter / greetd) keyboard layout: Colemak.
    # The greeter module is imported by modules/nixos/default.nix.
    programs.noctalia-greeter.settings.keyboard = {
      layout = "us";
      variant = "colemak";
    };
  };
}
