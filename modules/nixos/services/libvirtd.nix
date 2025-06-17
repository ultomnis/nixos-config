{ config, ... }:

let
  cfg = config.luminosity.system.services.libvirtd;

in
{
  # libvirt management daemon
  virtualisation.libvirtd = {
    inherit (cfg) enable;
  };
}
