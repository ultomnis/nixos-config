{ lib, ... }:

{
  # Permit unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-jupiter-original"
    "steam-original"
    "steam-run"
    "steamdeck-hw-theme"
  ];
}
