{
  imports = [
    ../../home
  ];

  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "23.05";
    # Source the wallpaper file
    file.".config/wallpaper.jpg".source = ../../assets/wallpapers/michael-diane-weidner-u8X0HCV2X1Y-unsplash.jpg;
  };

  programs.home-manager.enable = true;

  # Hyprland
  wayland.windowManager.hyprland.settings = {
    # Configure monitor
    monitor = "DP-3, 1920x1080@144, 0x0, 1";
  };
}
