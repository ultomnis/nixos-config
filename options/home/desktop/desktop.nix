{
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  inherit (lib)
    mkOption
    types
    ;

  mkDesktopOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = if (osConfig != null) then (osConfig.luminosity.selections.desktop != null) else false;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.desktop = {
    dconf = mkDesktopOption "dconf" { };

    fonts = mkDesktopOption "font configuration" {
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

    nixConfig = mkDesktopOption "user-specific Nix settings" { };

    themes = mkDesktopOption "theme configuration" {
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

    variables = mkDesktopOption "environment variables configuration" {
      extraVariables = mkOption {
        type =
          with types;
          lazyAttrsOf (oneOf [
            str
            path
            int
            float
          ]);

        default = { };
        description = "Extra environment variables to set at login.";
      };
    };
  };
}
