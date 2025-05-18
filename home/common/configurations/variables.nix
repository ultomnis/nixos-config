{
  config,
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.configurations.variables;
  editor =
    if (osConfig != null) then
      osConfig.luminosity.selections.editor
    else
      config.luminosity.selections.editor;
  terminal =
    if (osConfig != null) then
      osConfig.luminosity.selections.terminal
    else
      config.luminosity.selections.terminal;

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
