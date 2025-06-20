{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.environment.gtk;

in
{
  gtk = {
    inherit (cfg) enable;

    font =
      lib.optionalAttrs (cfg.font.name != null) {
        name = cfg.font.name;
      }
      |> lib.recursiveUpdate (
        lib.optionalAttrs (cfg.font.size != null) {
          size = cfg.font.size;
        }
      );

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
