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
          (lib.optionalAttrs (firefox.enable) {
            firefox = {
              colorTheme.enable = true;
              firefoxGnomeTheme.enable = true;

              profileNames = firefox.profiles |> builtins.map (profile: profile.name);
            };
          })
          |> lib.recursiveUpdate (
            lib.optionalAttrs (waybar.enable) {
              waybar.font = "serif";
            }
          );
      }
      |> lib.recursiveUpdate (
        lib.optionalAttrs (systemOS == "linux") {
          iconTheme = {
            enable = true;
            package = cfg.icons.package;
            dark = cfg.icons.dark;
            light = cfg.icons.light;
          };
        }
      );
  };
}
