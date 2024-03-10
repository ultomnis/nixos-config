{
  # dconf
  dconf.settings = {
    # Add default QEMU/KVM hypervisor for virt-manager
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # GNOME Keyring
  services.gnome-keyring.enable = true;
}
