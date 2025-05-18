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

  luminosity.home = {
    desktop.environment = {
      fonts.size = 13;
    };

    programs = {
      graphical = {
        enable = true;
        bitwarden.sshAgent.enable = true;
        wezterm.maxFPS = 120;
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
