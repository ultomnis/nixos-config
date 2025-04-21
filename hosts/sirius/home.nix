{ inputs, osConfig, ... }:

let
  inherit (osConfig.luminosity.system.configurations) primaryUser;

in
{
  imports = [
    ../../home/common
    ../../home/nixos
    ../../options/home
  ];

  home = {
    username = "${primaryUser.name}";
    homeDirectory = "${osConfig.users.users.${primaryUser.name}.home}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  luminosity = {
    desktop = {
      fonts.size = 10;

      selections = {
        launcher = "fuzzel";
        terminal = "wezterm";
        wallpaper = inputs.self + "/assets/wallpapers/kemo-sahab-4V0tz5FEvTc-unsplash.jpg";
      };

      environment.sway = {
        output = {
          DP-2 = {
            mode = "1920x1080@165Hz";
          };
        };
      };
    };

    programs = {
      graphical.enable = true;

      terminal = {
        enable = true;

        git = {
          userName = "ultomnis";
          email = "125839032+ultomnis@users.noreply.github.com";
        };

        ollama = {
          environmentVariables = {
            HSA_OVERRIDE_GFX_VERSION = "11.0.1";
          };
        };
      };
    };
  };
}
