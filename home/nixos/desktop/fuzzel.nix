{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (config.luminosity.desktop) selections;

in
{
  config = lib.mkIf (selections.launcher == "fuzzel") {
    # Wayland application launcher
    programs.fuzzel = {
      enable = true;

      settings = {
        main = {
          icon-theme = "Papirus";
          terminal = lib.mkIf (selections.terminal != null) "${lib.getExe pkgs.${selections.terminal}} -e";
        };

        border = {
          width = 0;
          radius = 0;
        };

        colors = {
          background = "000000ff";
        };
      };
    };
  };
}
