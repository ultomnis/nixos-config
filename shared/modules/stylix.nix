{ config, lib, ... }:

let
  cfg = config.luminosity.stylix;

in
{
  stylix = {
    inherit (cfg) enable;
    autoEnable = false;
    base16Scheme = cfg.base16;

    fonts = {
      serif = {
        package = cfg.fonts.package;
        name = cfg.fonts.serif;
      };

      sansSerif = {
        package = cfg.fonts.package;
        name = cfg.fonts.sansSerif;
      };

      monospace = {
        package = cfg.fonts.package;
        name = cfg.fonts.monospace;
      };

      sizes = {
        applications = cfg.fonts.applicationSize;
        desktop = cfg.fonts.desktopSize;
        popups = cfg.fonts.popupSize;
        terminal = cfg.fonts.terminalSize;
      };
    };

    image = lib.mkIf (cfg.image != null) cfg.image;

    opacity = {
      desktop = cfg.opacity.desktop;
      popups = cfg.opacity.popups;
      terminal = cfg.opacity.terminal;
    };

    polarity = cfg.polarity;
  };
}
