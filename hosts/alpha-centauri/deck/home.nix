{ username, ... }:

{
  imports = [
    ../../../home/common
    ../../../home/nixos
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
          mangohud.enable = false;
          wezterm.font.size = 11;
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
  };
}
