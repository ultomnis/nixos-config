{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.dolphin;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs.kdePackages)
        dolphin
        kio-fuse
        kio-extras
        qtsvg
        ;
    };
  };
}
