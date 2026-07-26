{
  flake = {
    # The `programs.noctalia-greeter` option is provided by the consumer
    # (e.g. machines imports noctalia-greeter.nixosModules.default). colemak
    # only configures it via modules/nixos/greeter.nix, so we do NOT import
    # the greeter flake module here — importing it in both colemak and the
    # consumer double-defines `programs.noctalia-greeter.package`.
    nixosModule = import ../nixos/default.nix;
    nixosModules = {
      default = import ../nixos/default.nix;
      colemak = import ../nixos/default.nix;
    };
  };
}
