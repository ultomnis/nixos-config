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

    home.packages = [
      pkgs.nerd-fonts.hack
      pkgs.noto-fonts
    ] ++ cfg.extraPackages;
  };
}
