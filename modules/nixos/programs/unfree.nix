{ lib, ... }:

{
  # Permit unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "7zz" # Nexus Mods App
    "steam"
    "steam-unwrapped"
  ];
}
