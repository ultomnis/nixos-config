{ lib, osConfig, ... }:

let
  inherit (osConfig.luminosity.selections) launcher;

in
{
  config = lib.mkIf (launcher == "fuzzel") {
    # Wayland application launcher
    programs.fuzzel = {
      enable = true;

      settings = {
        main = {
          icon-theme = "Papirus";
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
