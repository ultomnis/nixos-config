{ config, ... }:

let
  cfg = config.luminosity.modules.system.services.libvirtd;

in
{
  # libvirt management daemon
  virtualisation.libvirtd = {
    inherit (cfg) enable;
  };
}
