{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.gui.krita;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.krita.overrideAttrs (oldAttrs: {
        buildInputs = oldAttrs.buildInputs ++ [
          pkgs.libsForQt5.qt5.qtimageformats
        ];
      }))
    ];
  };
}
