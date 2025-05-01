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
    # Allow fontconfig to discover fonts
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      cfg.package
      noto-fonts
    ];
  };
}
