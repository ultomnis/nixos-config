{
  # dconf
  dconf.settings = {
    # Dark theme
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  
    # Add default QEMU/KVM hypervisor for virt-manager
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # GNOME Keyring
  services.gnome-keyring.enable = true;

  # Configure the theme for GTK applications
  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
