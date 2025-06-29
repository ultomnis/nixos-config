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
      configurations.enable = mkEnableOption "home configurations";

      environment.enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.desktop != null;
        description = "Whether to enable desktop environment configurations.";
      };

      minimal.enable = mkOption {
        type = types.bool;

        default = (
          builtins.elem config.luminosity.home.selections.desktop [
            "aerospace"
            "sway"
          ]
        );

        description = "Whether to enable window manager configurations.";
      };
    };

    programs = {
      graphical.enable = mkEnableOption "graphical programs";
      terminal.enable = mkEnableOption "terminal programs";
    };
  };
}
