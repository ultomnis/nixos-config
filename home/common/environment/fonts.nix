{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.environment.fonts;
  inherit (pkgs.stdenv) isLinux;

in
{
  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        # Allow fontconfig to discover fonts
        fonts.fontconfig.enable = true;

        home.packages = [
          pkgs.noto-fonts
        ] ++ lib.optional (cfg.package != null) cfg.package;
      }

      (lib.mkIf isLinux {
        gtk.font = {
          name = lib.mkIf (cfg.propo != null) cfg.propo;
          size = lib.mkIf (cfg.size != null) cfg.size;
        };
      })
    ]
  );
}
