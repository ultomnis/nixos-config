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
      universal.enable = true;
    };

    programs = {
      cli = {
        enable = true;

        git = {
          userEmail = "125839032+ultomnis@users.noreply.github.com";
          userName = "ultomnis";
        };
      };

      gui = {
        enable = true;
        wezterm.maxFPS = 120;
      };

      tui.enable = true;
    };

    selections = {
      desktop = osConfig.luminosity.modules.selections.desktop;
      editor = "helix";
      shell = osConfig.luminosity.modules.selections.shell;
      terminal = "wezterm";
    };
  };
}
