{ lib, ... }:

with lib;

{
  # When colemak.enable = true, all subsystem modules enable by default.
  # Each can be disabled independently via colemak.<subsystem>.enable = false.
  options.colemak.enable = mkEnableOption "Enable all Colemak modules (console, GUI, editor keybindings)";
}
