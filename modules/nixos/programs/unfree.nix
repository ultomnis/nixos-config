{ lib, ... }:

{
  # Permit unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "7zz"
    "steam"
    "steam-unwrapped"
  ];
}
