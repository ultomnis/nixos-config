{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.nexusmods-app;
  inherit (config.luminosity.home.configurations) unfree;

in
{
  config = lib.mkIf (cfg.enable && unfree.enable) {
    # Mod manager
    home.packages = with pkgs; [
      nexusmods-app-unfree
    ];

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
