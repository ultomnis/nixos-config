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
      {
        EDITOR = lib.mkIf (editor != null) (lib.getExe pkgs.${editor});
        TERMINAL = lib.mkIf (terminal != null) (lib.getExe pkgs.${terminal});
      }
      |> lib.recursiveUpdate cfg.extraVariables;
  };
}
