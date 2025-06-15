{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.configurations.variables;

in
{
  config = lib.mkIf cfg.enable {
    home.sessionVariables =
      lib.optionalAttrs (cfg.editor != null) {
        EDITOR = lib.getExe pkgs.${cfg.editor};
      }
      |> lib.recursiveUpdate (
        lib.optionalAttrs (cfg.terminal != null) {
          TERMINAL = lib.getExe pkgs.${cfg.terminal};
        }
      )
      |> lib.recursiveUpdate cfg.extraVariables;
  };
}
