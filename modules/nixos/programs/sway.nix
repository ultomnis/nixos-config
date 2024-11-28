{
  # NixOS module for Sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
