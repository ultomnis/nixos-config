{ userConfig, ... }:

{
  # Manage virtual machines via libvirt
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  users.users.${userConfig.username}.extraGroups = [ "libvirtd" ];
}
