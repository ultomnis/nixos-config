{
  config,
  lib,
  systemOS,
  ...
}:

let
  cfg = config.luminosity.home.desktop.environment.stylix;
  firefox = config.luminosity.home.programs.graphical.firefox;
  waybar = config.luminosity.home.desktop.minimal.waybar;

in
{
  config = lib.mkIf cfg.enable {
    stylix =
      lib.optionalAttrs (firefox.enable) {
        targets.firefox.colorTheme.enable = true;
        targets.firefox.firefoxGnomeTheme.enable = true;
        targets.firefox.profileNames = [
          "default"
        ];
      }
      // lib.optionalAttrs (waybar.enable) {
        targets.waybar.font = "serif";
      }
      // lib.optionalAttrs (systemOS == "linux") {
        iconTheme = {
          enable = true;
          package = lib.mkIf (cfg.icons.package != null) cfg.icons.package;
          dark = lib.mkIf (cfg.icons.dark != null) cfg.icons.dark;
          light = lib.mkIf (cfg.icons.light != null) cfg.icons.light;
        };
      };
  };
}
