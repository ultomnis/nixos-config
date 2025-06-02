{
  imports = [
    ../../home/common
    ../../home/nixos
    ../../modules/home
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
      };

      programs = {
        graphical = {
          enable = true;
          bitwarden.sshAgent.enable = true;

          firefox.profiles = [
            {
              id = 0;
              name = "default";
            }
          ];

          mangohud.enable = false;

          thunderbird.profiles = [
            {
              isDefault = true;
              name = "default";
            }
          ];
        };

        terminal = {
          enable = true;

          git = {
            delta.theme = "base16-stylix";
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
