{ config, lib, ... }:

let
  cfg = config.luminosity.modules.system.configurations.cursor;

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
