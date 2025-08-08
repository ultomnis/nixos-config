{ osConfig, ... }:

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
    desktop = {
      configurations.enable = true;
    };

    programs = {
      graphical = {
        enable = true;
        wezterm.maxFPS = 120;
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
      desktop = osConfig.luminosity.selections.desktop;
      editor = "helix";
      shell = osConfig.luminosity.selections.shell;
      terminal = "wezterm";
    };
  };
}
