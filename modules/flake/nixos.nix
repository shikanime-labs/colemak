{ inputs, ... }:

let
  default = {
    imports = [
      ../nixos/default.nix
      inputs.noctalia-greeter.nixosModules.default
    ];
  };
in
{
  flake = {
    # Noctalia Greeter flake module provides the `programs.noctalia-greeter`
    # option consumed by colemak's greeter subsystem module. It is composed
    # here so the colemak NixOS modules need only set the option.
    nixosModule = default;
    nixosModules = {
      default = default;
      colemak = default;
    };
  };
}
