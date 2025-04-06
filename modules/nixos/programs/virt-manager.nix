{ vars, ... }:

{
  # Manage virtual machines via libvirt
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  users.users.${vars.userConfig.name}.extraGroups = [ "libvirtd" ];
}
