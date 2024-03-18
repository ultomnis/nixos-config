{
  # Wallpaper utility
  services.hyprpaper = {
    enable = true;

    preloads = [
      "~/.config/wallpaper.jpg"
    ];

    wallpapers = [
      "eDP-1,~/.config/wallpaper.jpg"
      "DP-3,~/.config/wallpaper.jpg"
    ];
  };
}
