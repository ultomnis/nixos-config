{ userConfig, ... }:

{
  # Virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.${userConfig.username}.extraGroups = [ "libvirtd" ];
}
