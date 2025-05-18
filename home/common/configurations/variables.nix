{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.configurations.variables;

  inherit (config.luminosity.home.selections)
    editor
    terminal
    ;

in
{
  config = lib.mkIf cfg.enable {
    home.sessionVariables =
      lib.optionalAttrs (editor != null) {
        EDITOR = lib.getExe pkgs.${editor};
      }
      // lib.optionalAttrs (terminal != null) {
        TERMINAL = lib.getExe pkgs.${terminal};
      }
      // cfg.extraVariables;
  };
}
