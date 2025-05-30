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
        base16Scheme = lib.mkIf (cfg.base16 != null) cfg.base16;
        image = lib.mkIf (cfg.image != null) cfg.image;

        fonts = {
          serif = {
            package = lib.mkIf (cfg.fonts.package != null) cfg.fonts.package;
            name = lib.mkIf (cfg.fonts.serif != null) cfg.fonts.serif;
          };

          sansSerif = {
            package = lib.mkIf (cfg.fonts.package != null) cfg.fonts.package;
            name = lib.mkIf (cfg.fonts.sansSerif != null) cfg.fonts.sansSerif;
          };

          monospace = {
            package = lib.mkIf (cfg.fonts.package != null) cfg.fonts.package;
            name = lib.mkIf (cfg.fonts.monospace != null) cfg.fonts.monospace;
          };

          sizes = {
            applications = lib.mkIf (cfg.fonts.applicationSize != null) cfg.fonts.applicationSize;
            desktop = lib.mkIf (cfg.fonts.desktopSize != null) cfg.fonts.desktopSize;
            popups = lib.mkIf (cfg.fonts.popupSize != null) cfg.fonts.popupSize;
            terminal = lib.mkIf (cfg.fonts.terminalSize != null) cfg.fonts.terminalSize;
          };
        };

        polarity = lib.mkIf (cfg.polarity != null) cfg.polarity;
      }
      |> lib.recursiveUpdate (
        lib.optionalAttrs (systemOS == "linux") {
          cursor = {
            package = lib.mkIf (cfg.cursor.package != null) cfg.cursor.package;
            name = lib.mkIf (cfg.cursor.name != null) cfg.cursor.name;
            size = lib.mkIf (cfg.cursor.size != null) cfg.cursor.size;
          };
        }
      );
  };
}
