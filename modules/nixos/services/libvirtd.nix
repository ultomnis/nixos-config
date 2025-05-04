{
  config,
  lib,
  userName,
  ...
}:

let
  cfg = config.luminosity.system.services.libvirtd;

in
{
  config = lib.mkIf cfg.enable {
    # libvirt management daemon
    virtualisation.libvirtd.enable = true;
    users.users.${userName}.extraGroups = [ "libvirtd" ];
  };
}
