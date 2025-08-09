{ config, ... }:

let
  cfg = config.luminosity.modules.services.libvirtd;

in
{
  # libvirt management daemon
  virtualisation.libvirtd = {
    inherit (cfg) enable;
  };
}
