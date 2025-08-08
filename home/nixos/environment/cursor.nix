{ config, lib, ... }:

let
  cfg = config.luminosity.desktop.environment.cursor;

in
{
  config = lib.mkIf cfg.enable {
    stylix.cursor = {
      package = cfg.package;
      name = cfg.name;
      size = cfg.size;
    };
  };
}
