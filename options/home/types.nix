{
  config,
  lib,
  osConfig ? null,
  ...
}:

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
      configurations.enable = mkOption {
        type = types.bool;
        default = osConfig.luminosity.system.configurations.enable or false;
        description = "Whether to enable home configurations.";
      };

      environment.enable = mkOption {
        type = types.bool;
        default = (osConfig.luminosity.selections.desktop or config.luminosity.selections.desktop) != null;
        description = "Whether to enable desktop environment configurations.";
      };

      minimal.enable = mkOption {
        type = types.bool;

        default = (
          builtins.elem (osConfig.luminosity.selections.desktop or config.luminosity.selections.desktop) [
            "aerospace"
            "sway"
          ]
        );

        description = "Whether to enable window manager configurations.";
      };
    };

    programs = {
      graphical.enable = mkEnableOption "Whether to enable graphical programs.";
      terminal.enable = mkEnableOption "Whether to enable terminal programs.";
    };
  };
}
