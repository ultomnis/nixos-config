{
  # Source the wallpapers
  home.file.".config/sky.jpg".source = ../../assets/wallpapers/michael-diane-weidner-u8X0HCV2X1Y-unsplash.jpg;
  home.file.".config/mountains.jpg".source = ../../assets/wallpapers/matt-wang-FaFZCtl1yug-unsplash.jpg;

  # Wallpaper utility
  services.hyprpaper = {
    enable = true;

    preloads = [
      "~/.config/sky.jpg"
      "~/.config/mountains.jpg"
    ];

    wallpapers = [
      "DP-3,~/.config/sky.jpg"
      "eDP-1,~/.config/mountains.jpg"
    ];
  };
}
