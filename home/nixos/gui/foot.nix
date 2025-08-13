{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.gui.foot;

in
{
  # Wayland terminal emulator
  programs.foot = {
    inherit (cfg) enable;

    settings = {
      main = {
        pad = "5x5";
        shell = lib.mkIf (cfg.shell != null) (lib.getExe pkgs.${cfg.shell});
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };

  stylix.targets.foot = {
    inherit (cfg) enable;
  };
}
