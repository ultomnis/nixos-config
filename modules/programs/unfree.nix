{ lib, ... }:

{
  # Permit unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "reaper"
    "steam"
    "steam-original"
    "steam-run"
  ];
}
