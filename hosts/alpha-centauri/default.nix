{ lib, ... }:

{
  imports = [
    ../../home/common
    ../../home/nixos
    ../../options/common
    ../../options/home
  ];

  home = {
    username = "deck";
    homeDirectory = "/home/deck";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  luminosity = {
    home = {
      desktop = {
        configurations = {
          enable = true;
          unfree.enable = false;
        };

        minimal.ssh-agent.enable = true;
      };

      programs = {
        graphical = {
          enable = true;

          firefox.profiles = lib.singleton {
            id = 0;
            name = "default";
          };

          mangohud.enable = false;

          thunderbird.profiles = lib.singleton {
            isDefault = true;
            name = "default";
          };
        };

        terminal = {
          enable = true;

          git = {
            email = "125839032+ultomnis@users.noreply.github.com";
            userName = "ultomnis";
          };
        };
      };
    };

    selections = {
      editor = "helix";
    };
  };
}
