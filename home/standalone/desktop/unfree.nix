{ config, lib, ... }:

let
  cfg = config.luminosity.home.configurations.unfree;

in
{
  config = lib.mkIf cfg.enable {
    nixpkgs.config = {
      # Permit unfree packages
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "7zz"
        ];
    };
  };
}
