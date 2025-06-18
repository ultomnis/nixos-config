{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.environment.gtk;

in
{
  gtk =
    {
      inherit (cfg) enable;

      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };

      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    }
    |> lib.recursiveUpdate (
      lib.optionalAttrs (cfg.font.name != null) {
        font.name = cfg.font.name;
      }
    )
    |> lib.recursiveUpdate (
      lib.optionalAttrs (cfg.font.size != null) {
        font.size = cfg.font.size;
      }
    );
}
