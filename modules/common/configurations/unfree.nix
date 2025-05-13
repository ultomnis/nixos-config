{ config, lib, ... }:

let
  cfg = config.luminosity.system.configurations.unfree;

in
{
  config = lib.mkIf cfg.enable {
    nixpkgs.config = {
      # Permit unfree packages
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "7zz" # Nexus Mods App
          "steam"
          "steam-unwrapped"
        ];
    };
  };
}
