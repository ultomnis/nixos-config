{
  # Wayland screen locker
  programs.swaylock = {
    enable = true;

    settings = {
      image = "${../../../assets/wallpapers/wallpaper.jpg}";
      scaling = "fill";
      show-failed-attempts = true;
    };
  };
}
