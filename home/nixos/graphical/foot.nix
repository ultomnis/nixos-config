{
  config,
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.foot;
  shell = osConfig.luminosity.selections.shell or config.luminosity.selections.shell;

in
{
  config = lib.mkIf cfg.enable {
    # Wayland terminal emulator
    programs.foot = {
      enable = true;

      settings = {
        main = {
          pad = "5x5";
          shell = lib.mkIf (shell != null) (lib.getExe pkgs.${shell});
        };

        mouse = {
          hide-when-typing = "yes";
        };
      };
    };
  };
}
