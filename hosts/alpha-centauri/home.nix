{ userName, ... }:

{
  imports = [
    ../../home/common
    ../../home/nixos
    ../../options/home
  ];

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  luminosity.home = {
    configurations = {
      nixConfig.enable = true;
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
          userName = "ultomnis";
          email = "125839032+ultomnis@users.noreply.github.com";
        };
      };
    };
  };
}
