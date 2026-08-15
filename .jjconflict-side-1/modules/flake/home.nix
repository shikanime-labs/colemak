{
  flake = {
    homeModule = import ../home/default.nix;
    homeModules = {
      default = import ../home/default.nix;
      colemak = import ../home/default.nix;
    };
  };
}
