{ config, ... }:

{
  # Wayland screen locker
  programs.swaylock = {
    enable = true;

    settings = {
      image = "${config.home.homeDirectory}/.config/wallpaper.jpg";
      scaling = "fill";
      show-failed-attempts = true;
    };
  };
}
