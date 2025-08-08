{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.environment.fonts;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.noto-fonts
    ];
  };
}
