{
  flake = {
    nixosModule = import ../nixos/default.nix;
    nixosModules = {
      default = import ../nixos/default.nix;
      colemak = import ../nixos/default.nix;
    };
  };
}
