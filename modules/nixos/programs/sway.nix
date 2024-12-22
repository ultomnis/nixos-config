{
  # Tiling Wayland compositor
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
