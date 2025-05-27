{ inputs, userName, ... }:

{
  imports = [
    ../../home/common
    ../../home/nixos
    ../../modules/home
    ../../options/common
    ../../options/home
  ];

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
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

        environment.enable = true;
      };

      programs = {
        graphical = {
          enable = true;
          bitwarden.sshAgent.enable = true;
          mangohud.enable = false;
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

    stylix = {
      enable = true;
      image = inputs.self + "/assets/wallpapers/max-lederer-y0vXb9Hd3Yw-unsplash.jpg";
    };
  };
}
