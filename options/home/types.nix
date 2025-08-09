{ config, lib, ... }:

let
  inherit (lib)
    mkEnableOption
    mkOption
    types
    ;

in
{
  options.luminosity.home = {
    desktop = {
      hybrid.enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.desktop != null;
        description = "Whether to enable configurations for compositors and desktop environments.";
      };

      minimal.enable = mkOption {
        type = types.bool;

        default = (
          builtins.elem config.luminosity.home.selections.desktop [
            "aerospace"
            "sway"
          ]
        );

        description = "Whether to enable configurations for minimal compositors.";
      };

      universal.enable = mkEnableOption "configurations for any environment";
    };

    programs = {
      cli.enable = mkEnableOption "CLI programs";
      gui.enable = mkEnableOption "GUI programs";
      tui.enable = mkEnableOption "TUI programs";
    };
  };
}
