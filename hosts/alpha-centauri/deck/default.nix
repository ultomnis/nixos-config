{ lib, username, ... }:

{
  imports = [
    ../../../home/common
    ../../../home/nixos
    ../../../options/common
    ../../../options/home
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
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

        environment = {
          enable = true;
          gtk.enable = false;
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
            userEmail = "125839032+ultomnis@users.noreply.github.com";
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
