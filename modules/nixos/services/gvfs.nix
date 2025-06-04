{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.gvfs;

in
{
  config = lib.mkIf cfg.enable {
    # GNOME Virtual file system
    services.gvfs.enable = true;
  };
}
