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
        hybrid.enable = true;
        universal.enable = true;
      };

      programs = {
        cli = {
          enable = true;

          git = {
            userEmail = "125839032+ultomnis@users.noreply.github.com";
            userName = "ultomnis";
          };
        };

        gui = {
          enable = true;
          mangohud.enable = false;
        };

        tui.enable = true;
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
