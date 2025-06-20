{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.environment.cursors;

in
{
  home.pointerCursor =
    {
      size = 24;
      gtk.enable = true;
    }
    |> lib.recursiveUpdate (
      lib.optionalAttrs (cfg.package != null && cfg.name != null) {
        name = cfg.name;
        package = cfg.package;
      }
    );
}
