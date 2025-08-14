{ username, ... }:

{
  imports = [
    ../../../home/common
    ../../../home/nixos
    ../../../options/home
    ../../../shared

    ../../../secrets/home.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  stylix.targets = {
    gtk.enable = false;
    qt.enable = false;
  };

  luminosity = {
    home = {
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

      hybrid.enable = true;

      selections = {
        editor = "helix";
        shell = "fish";
        terminal = "wezterm";
      };

      tui.enable = true;
      universal.enable = true;
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
