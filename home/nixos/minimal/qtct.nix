{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.qtct;

in
{
  config = lib.mkIf cfg.enable {
    # Qt Configuration Tool
    qt = {
      enable = true;
      platformTheme.name = "qtct";
    };

    xdg.configFile = {
      "kdeglobals" = {
        force = true;

        text = ''
          [UiSettings]
          ColorScheme=rose-pine-foam
        '';
      };
    };
  };
}
