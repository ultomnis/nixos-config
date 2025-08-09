{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.hybrid.fonts;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.noto-fonts
    ];
  };
}
