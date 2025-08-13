{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.gui.rio;

in
{
  # Terminal emulator
  programs.rio = {
    inherit (cfg) enable;

    settings = {
      confirm-before-quit = false;
      padding-x = 5;

      padding-y = [
        5
        5
      ];

      shell.program = lib.mkIf (cfg.shell != null) (lib.getExe pkgs.${cfg.shell});
      window.decorations = "Transparent";
    };
  };
}
