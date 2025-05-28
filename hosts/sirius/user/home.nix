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
          delta.theme = "base16-stylix";
          email = "125839032+ultomnis@users.noreply.github.com";
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
