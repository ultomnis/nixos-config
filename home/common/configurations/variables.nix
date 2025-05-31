{
  config,
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.configurations.variables;
  editor = osConfig.luminosity.selections.editor or config.luminosity.selections.editor;
  terminal = osConfig.luminosity.selections.terminal or config.luminosity.selections.terminal;

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
