{ userName, ... }:

{
  imports = [
    ../../home/common
    ../../home/darwin
    ../../options/home
  ];

  home = {
    username = userName;
    homeDirectory = "/Users/${userName}";
    stateVersion = "24.05";
    file.".hushlogin".text = "";
  };

  programs.home-manager.enable = true;

  luminosity = {
    desktop = {
      fonts.size = 13;
    };

    programs = {
      graphical = {
        enable = true;
        bitwarden.sshAgent.enable = true;
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
