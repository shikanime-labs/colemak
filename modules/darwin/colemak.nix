{ lib, ... }:

with lib;

{
  options.colemak.enable = mkEnableOption "Enable Colemak keyboard layout (console and GUI) at OS level";

  # When colemak.enable = true, all OS-level subsystem modules enable by default.
  # Each can be disabled independently via colemak.<subsystem>.enable = false.
}
