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
        default = if (osConfig != null) then (osConfig.luminosity.system.configurations.enable) else false;
        description = "Whether to enable home configurations.";
      };

      environment.enable = mkOption {
        type = types.bool;
        default =
          if (osConfig != null) then
            (osConfig.luminosity.selections.desktop != null)
          else
            (config.luminosity.selections.desktop != null);
        description = "Whether to enable desktop environment configurations.";
      };

      minimal.enable = mkOption {
        type = types.bool;

        default =
          if (osConfig != null) then
            (builtins.elem osConfig.luminosity.selections.desktop [
              "aerospace"
              "sway"
            ])
          else
            (builtins.elem config.luminosity.selections.desktop [
              "aerospace"
              "sway"
            ]);

        description = "Whether to enable window manager configurations.";
      };
    };

    programs = {
      graphical.enable = mkEnableOption "Whether to enable graphical programs.";
      terminal.enable = mkEnableOption "Whether to enable terminal programs.";
    };
  };
}
