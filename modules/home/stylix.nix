{
  config,
  lib,
  systemOS,
  ...
}:

let
  cfg = config.luminosity.stylix;

in
{
  config = lib.mkIf cfg.enable {
    stylix =
      {
        enable = true;
        base16Scheme = cfg.base16;
        image = lib.mkIf (cfg.image != null) cfg.image;

        fonts = {
          serif = {
            package = cfg.fonts.package;
            name = cfg.fonts.serif;
          };

          sansSerif = {
            package = cfg.fonts.package;
            name = cfg.fonts.sansSerif;
          };

          monospace = {
            package = cfg.fonts.package;
            name = cfg.fonts.monospace;
          };

          sizes = {
            applications = cfg.fonts.applicationSize;
            desktop = cfg.fonts.desktopSize;
            popups = cfg.fonts.popupSize;
            terminal = cfg.fonts.terminalSize;
          };
        };

        polarity = cfg.polarity;
      }
      |> lib.recursiveUpdate (
        lib.optionalAttrs (systemOS == "linux") {
          cursor = {
            package = cfg.cursor.package;
            name = cfg.cursor.name;
            size = cfg.cursor.size;
          };
        }
      );
  };
}
