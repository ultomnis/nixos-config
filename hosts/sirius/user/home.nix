{
  lib,
  pkgs,
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
      environment = {
        fonts.size = 10;
      };

      minimal = {
        waybar.menuCommand = "${lib.getExe pkgs.fuzzel} --anchor top-left";
      };
    };

    programs = {
      graphical = {
        enable = true;

        firefox.profiles = lib.singleton {
          id = 0;
          name = "default";
        };

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
  };
}
