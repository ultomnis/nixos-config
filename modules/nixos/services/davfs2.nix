{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.davfs2;

in
{
  config = lib.mkIf cfg.enable {
    # Mount WebDAV resources
    services.davfs2.enable = true;
  };
}
