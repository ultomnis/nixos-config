{ config, lib, ... }:

let
  cfg = config.luminosity.modules.system.configurations.unfree;

in
{
  config = lib.mkIf cfg.enable {
    nixpkgs.config = {
      # Permit unfree packages
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "steam"
          "steam-unwrapped"
        ];
    };
  };
}
