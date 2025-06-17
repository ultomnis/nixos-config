{ config, ... }:

let
  cfg = config.luminosity.system.services.gvfs;

in
{
  # GNOME Virtual file system
  services.gvfs = {
    inherit (cfg) enable;
  };
}
