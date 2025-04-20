{
  lib,
  pkgs,
  osConfig,
  ...
}:

let
  inherit (lib)
    mkOption
    types
    ;

  mkIsDesktopOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = osConfig.luminosity.system.selections.desktop != null;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.desktop = {
    dconf = mkIsDesktopOption "dconf" { };

    fonts = mkIsDesktopOption "font configuration" {
      package = mkOption {
        type = types.package;
        default = pkgs.nerd-fonts.hack;
        description = "Font package to install.";
      };

      regular = mkOption {
        type = types.str;
        default = "Hack Nerd Font";
        description = "Regular font name.";
      };

      mono = mkOption {
        type = types.str;
        default = "Hack Nerd Font Mono";
        description = "Monospace font name.";
      };

      propo = mkOption {
        type = types.str;
        default = "Hack Nerd Font Propo";
        description = "Proportional font name.";
      };

      size = mkOption {
        type = types.int;
        default = 12;
        description = "Font size.";
      };
    };

    themes = mkIsDesktopOption "theme configuration" {
      name = mkOption {
        type = types.str;
        default = "rose-pine";
        description = "GTK theme name.";
      };

      package = mkOption {
        type = types.package;
        default = pkgs.rose-pine-gtk-theme;
        description = "GTK theme package.";
      };

      cursorName = mkOption {
        type = types.str;
        default = "Bibata-Modern-Ice";
        description = "Cursor theme name.";
      };

      cursorPackage = mkOption {
        type = types.package;
        default = pkgs.bibata-cursors;
        description = "Cursor theme package.";
      };

      iconName = mkOption {
        type = types.str;
        default = "Papirus";
        description = "Icon theme name.";
      };

      iconPackage = mkOption {
        type = types.package;
        default = pkgs.papirus-icon-theme;
        description = "Icon theme package.";
      };
    };
  };
}
