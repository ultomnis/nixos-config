{
  # NixOS module for Sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  # Secret Service provider
  services.gnome.gnome-keyring.enable = true;
}
