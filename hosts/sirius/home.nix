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
        bitwarden.sshAgent.enable = true;
      };

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
  };
}
