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
    desktop.environment = {
      fonts.size = 13;
    };

    programs = {
      graphical = {
        enable = true;

        firefox.profiles = [
          {
            id = 0;
            name = "default";
          }
        ];

        thunderbird.profiles = [
          {
            isDefault = true;
            name = "default";
          }
        ];

        wezterm.maxFPS = 120;
      };

      terminal = {
        enable = true;

        git = {
          email = "125839032+ultomnis@users.noreply.github.com";
          userName = "ultomnis";
        };
      };
    };
  };
}
