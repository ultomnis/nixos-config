{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.desktop.fonts;

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
