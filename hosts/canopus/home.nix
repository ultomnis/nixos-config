{ osConfig, ... }:

let
  inherit (osConfig.luminosity.system.configurations) primaryUser;

in
{
  imports = [
    ../../home/common
    ../../home/darwin
    ../../options/home
  ];

  home = {
    username = "${primaryUser.name}";
    homeDirectory = "${osConfig.users.users.${primaryUser.name}.home}";
    stateVersion = "24.05";
    file.".hushlogin".text = "";
  };

  programs.home-manager.enable = true;

  luminosity = {
    desktop = {
      fonts.size = 13;
      selections.terminal = "wezterm";
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
}
