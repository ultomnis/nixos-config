{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.universal.variables;

in
{
  config = lib.mkIf cfg.enable {
    home.sessionVariables = lib.mkMerge [
      (lib.mkIf (cfg.editor != null) {
        EDITOR = lib.getExe pkgs.${cfg.editor};
      })

      (lib.mkIf (cfg.terminal != null) {
        TERMINAL = lib.getExe pkgs.${cfg.terminal};
      })

      cfg.extraVariables
    ];
  };
}
