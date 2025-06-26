{ username, ... }:

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
        configurations.enable = true;
        environment.enable = true;
      };

      programs = {
        graphical = {
          enable = true;
          dolphin.enable = false;
          mangohud.enable = false;
          nexusmods-app.enable = false;
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
