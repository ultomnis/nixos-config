{
  lib,
  pkgs,
  userName,
  ...
}:

{
  imports = [
    ../../home/common
    ../../home/nixos
    ../../options/home
  ];

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  luminosity = {
    desktop = {
      fonts.size = 10;
    };

    programs = {
      graphical.enable = true;

      terminal = {
        enable = true;

        git = {
          userName = "ultomnis";
          email = "125839032+ultomnis@users.noreply.github.com";
        };

        ollama = {
          environmentVariables = {
            HSA_OVERRIDE_GFX_VERSION = "11.0.1";
          };
        };
      };
    };

    settings = {
      launcherCommand = "${lib.getExe pkgs.fuzzel} --anchor top-left";

      swayOutput = {
        DP-2 = {
          mode = "1920x1080@165Hz";
        };
      };
    };
  };
}
