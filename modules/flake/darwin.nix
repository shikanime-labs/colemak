{
  flake = {
    darwinModule = import ../darwin/default.nix;
    darwinModules = {
      default = import ../darwin/default.nix;
      colemak = import ../darwin/colemak.nix;
    };
  };
}
