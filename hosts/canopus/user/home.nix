{
  imports = [
    ../../../home/common
    ../../../home/darwin
    ../../../options/home
  ];

  home = {
    username = "user";
    homeDirectory = "/Users/user";
    stateVersion = "24.05";
    file.".hushlogin".text = "";
  };

  programs.home-manager.enable = true;

  luminosity.home = {
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

        wezterm.maxFPS = 120;
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
}
