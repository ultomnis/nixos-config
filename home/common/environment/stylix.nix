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
      {
        targets =
          lib.optionalAttrs (firefox.enable) {
            firefox = {
              colorTheme.enable = true;
              firefoxGnomeTheme.enable = true;

              profileNames = firefox.profiles |> builtins.map (profile: profile.name);
            };
          }
          // lib.optionalAttrs (waybar.enable) {
            waybar.font = "serif";
          };
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
