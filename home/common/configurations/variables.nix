{
  config,
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.configurations.variables;
  nixConfig = if (osConfig != null) then osConfig else config;

in
{
  config = lib.mkIf cfg.enable {
    home.sessionVariables =
      lib.optionalAttrs (nixConfig.luminosity.selections.editor != null) {
        EDITOR = lib.getExe pkgs.${nixConfig.luminosity.selections.editor};
      }
      |> lib.recursiveUpdate (
        lib.optionalAttrs (nixConfig.luminosity.selections.terminal != null) {
          TERMINAL = lib.getExe pkgs.${nixConfig.luminosity.selections.terminal};
        }
      )
      |> lib.recursiveUpdate cfg.extraVariables;
  };
}
