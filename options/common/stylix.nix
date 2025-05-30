{ lib, pkgs, ... }:

let
  inherit (lib)
    mkEnableOption
    mkOption
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

      cursor = {
        package = mkOption {
          type = types.package;
          default = pkgs.bibata-cursors;
          description = "Cursor package.";
        };

        name = mkOption {
          type = types.str;
          default = "Bibata-Modern-Ice";
          description = "Cursor name.";
        };

        size = mkOption {
          type = types.int;
          default = 24;
          description = "Cursor size.";
        };
      };

      fonts = {
        package = mkOption {
          type = types.package;
          default = pkgs.nerd-fonts.hack;
          description = "Font package.";
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
          type = types.int;
          default = 12;
          description = "Application font size.";
        };

        desktopSize = mkOption {
          type = types.int;
          default = 12;
          description = "Desktop font size.";
        };

        popupSize = mkOption {
          type = types.int;
          default = 12;
          description = "Popup font size.";
        };

        terminalSize = mkOption {
          type = types.int;
          default = 12;
          description = "Terminal font size.";
        };
      };

      image = mkOption {
        type = types.nullOr types.path;
        default = null;
        description = "Path to the wallpaper.";
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
