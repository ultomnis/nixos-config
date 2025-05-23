{ userName, ... }:

{
  imports = [
    ../../home/common
    ../../home/nixos
    ../../options/home
    ../../options/modules/selections.nix
  ];

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  luminosity.home = {
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
        mangohud.enable = false;
        zed-editor.theme = "Rosé Pine";
      };

      terminal = {
        enable = true;

        git = {
          userName = "ultomnis";
          email = "125839032+ultomnis@users.noreply.github.com";
        };

        helix.theme = "rose_pine";
      };
    };
  };
}
