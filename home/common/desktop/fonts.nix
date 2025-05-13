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

        home.packages = with pkgs; [
          cfg.package
          noto-fonts
        ];
      }

      (lib.mkIf isLinux {
        gtk.font = {
          name = cfg.propo;
          size = cfg.size;
        };
      })
    ]
  );
}
