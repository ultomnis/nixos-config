{ config, ... }:

{
  # Wallpaper utility
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "${config.home.homeDirectory}/.config/wallpaper.jpg"
      ];

      splash = false;
    };
  };
}
