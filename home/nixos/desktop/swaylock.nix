{ self, ... }:

{
  # Wayland screen locker
  programs.swaylock = {
    enable = true;

    settings = {
      image = "${self}/assets/wallpaper.jpg";
      scaling = "fill";
      show-failed-attempts = true;
    };
  };
}
