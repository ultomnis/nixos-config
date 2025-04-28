{ userName, ... }:

{
  imports = [
    ../../home/common
    ../../options/home
    ../../options/modules
  ];

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  luminosity = {
    desktop = {
      nixConfig.enable = true;
    };

    programs = {
      graphical.enable = true;

      terminal = {
        enable = true;

        git = {
          userName = "ultomnis";
          email = "125839032+ultomnis@users.noreply.github.com";
        };
      };
    };
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "/home/${userName}/.bitwarden-ssh-agent.sock";
  };
}
