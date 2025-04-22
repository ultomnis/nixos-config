{
  config,
  lib,
  userName,
  ...
}:

let
  cfg = config.luminosity.system.programs.virt-manager;

in
{
  config = lib.mkIf cfg.enable {
    # Manage virtual machines via libvirt
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    users.users.${userName}.extraGroups = [ "libvirtd" ];
  };
}
