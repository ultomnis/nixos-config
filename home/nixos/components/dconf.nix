{
  # Low-level configuration system
  dconf.settings = {
    # Add default QEMU/KVM hypervisor for virt-manager
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
