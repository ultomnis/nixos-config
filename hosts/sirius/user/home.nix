{ lib, osConfig, ... }:

{
  imports = [
    ../../../home/common
    ../../../home/nixos
    ../../../options/home
    ../../../shared
  ];

  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  luminosity = {
    home = {
      cli = {
        enable = true;

        git = {
          userEmail = "125839032+ultomnis@users.noreply.github.com";
          userName = "ultomnis";
        };

        ollama = {
          environmentVariables = {
            HSA_OVERRIDE_GFX_VERSION = "11.0.1";
          };
        };
      };

      gui.enable = true;

      selections = {
        desktop = osConfig.luminosity.modules.selections.desktop;
        editor = "helix";

        monitors = lib.singleton {
          name = "DP-2";
          width = 1920;
          height = 1080;
          pos_x = 0;
          pos_y = 0;
          rate = 165;
        };

        shell = osConfig.luminosity.modules.selections.shell;
        terminal = "foot";
      };

      tui.enable = true;
      universal.enable = true;
    };

    stylix = osConfig.luminosity.stylix;
  };
}
