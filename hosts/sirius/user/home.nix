{
  inputs,
  lib,
  osConfig,
  ...
}:

{
  imports = [
    ../../../home/common
    ../../../home/nixos
    ../../../options/home
  ];

  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  luminosity.home = {
    desktop = {
      configurations.enable = true;

      environment = {
        fonts.size = 10;
      };
    };

    programs = {
      graphical = {
        enable = true;
        zed-editor.font.size = 13;
      };

      terminal = {
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
    };

    selections = {
      desktop = osConfig.luminosity.selections.desktop;
      editor = "helix";

      monitors = lib.singleton {
        name = "DP-2";
        height = 1920;
        width = 1080;
        pos_x = 0;
        pos_y = 0;
        rate = 165;
      };

      shell = osConfig.luminosity.selections.shell;
      terminal = "foot";
      wallpaper = inputs.self + "/assets/wallpapers/bence-balla-schottner-zwAevXBnEN0-unsplash.jpg";
    };
  };
}
