{ username, ... }:

{
  imports = [
    ../../../home/common
    ../../../home/nixos
    ../../../options/home
    ../../../shared
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
  stylix.targets.qt.enable = false;

  luminosity = {
    home = {
      desktop = {
        configurations.enable = true;
        environment.enable = true;
      };

      programs = {
        graphical = {
          enable = true;
          mangohud.enable = false;
        };

        terminal = {
          enable = true;

          git = {
            userEmail = "125839032+ultomnis@users.noreply.github.com";
            userName = "ultomnis";
          };
        };
      };

      selections = {
        editor = "helix";
        shell = "fish";
        terminal = "wezterm";
      };
    };

    stylix = {
      enable = true;

      fonts = {
        applicationSize = 11;
        desktopSize = 11;
        popupSize = 11;
        terminalSize = 11;
      };
    };
  };
}
