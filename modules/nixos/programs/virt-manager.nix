{ config, lib, ... }:

let
  inherit (config.luminosity.system.configurations) primaryUser;
  cfg = config.luminosity.system.programs.virt-manager;

in
{
  config = lib.mkIf cfg.enable {
    # Manage virtual machines via libvirt
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    users.users.${primaryUser.name}.extraGroups = [ "libvirtd" ];
  };
}
