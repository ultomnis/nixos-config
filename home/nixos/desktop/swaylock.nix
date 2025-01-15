{ self, ... }:

{
  # Wayland screen locker
  programs.swaylock = {
    enable = true;

    settings =
      let
        wallpaper = "${self}/assets/wallpaper.jpg";
      in
      {
        image = wallpaper;
        scaling = "fill";
        show-failed-attempts = true;
      };
  };
}
