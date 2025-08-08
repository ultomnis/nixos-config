{ lib, pkgs, ... }:

let
  inherit (lib)
    mkEnableOption
    mkOption
    mkPackageOption
    types
    ;

in
{
  options.luminosity = {
    stylix = {
      enable = mkEnableOption "Whether to enable Stylix.";

      base16 = mkOption {
        type = types.oneOf [
          types.attrs
          types.lines
          types.path
        ];

        default = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
        description = "Base16 scheme.";
      };

      fonts = {
        package = mkPackageOption pkgs "font" {
          default = [
            "nerd-fonts"
            "hack"
          ];
        };

        serif = mkOption {
          type = types.str;
          default = "Hack Nerd Font Propo";
          description = "Serif font name.";
        };

        sansSerif = mkOption {
          type = types.str;
          default = "Hack Nerd Font Propo";
          description = "Sans-serif font name.";
        };

        monospace = mkOption {
          type = types.str;
          default = "Hack Nerd Font Mono";
          description = "Monospace font name.";
        };

        applicationSize = mkOption {
          type = types.numbers.positive;
          default = 12;
          description = "Application font size.";
        };

        desktopSize = mkOption {
          type = types.numbers.positive;
          default = 12;
          description = "Desktop font size.";
        };

        popupSize = mkOption {
          type = types.numbers.positive;
          default = 12;
          description = "Popup font size.";
        };

        terminalSize = mkOption {
          type = types.numbers.positive;
          default = 12;
          description = "Terminal font size.";
        };
      };

      image = mkOption {
        type = types.nullOr types.path;
        default = null;
        description = "Path to the wallpaper.";
      };

      opacity = {
        desktop = mkOption {
          type = types.float;
          default = 0.8;
          description = "Desktop opacity.";
        };

        popups = mkOption {
          type = types.float;
          default = 0.8;
          description = "Popups opacity.";
        };

        terminal = mkOption {
          type = types.float;
          default = 0.8;
          description = "Terminal opacity.";
        };
      };

      polarity = mkOption {
        type = types.enum [
          "dark"
          "either"
          "light"
        ];

        default = "dark";
        description = "Light or dark theme.";
      };
    };
  };
}
