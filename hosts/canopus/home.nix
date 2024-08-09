{ userConfig, ... }:

{
  imports = [
    ../../home
  ];

  home = {
    username = "${userConfig.username}";
    homeDirectory = "/home/${userConfig.username}";
    stateVersion = "24.05";
    # Source the wallpaper
    file.".config/wallpaper.jpg".source = ../../assets/wallpapers/eugene-ga-CvhUptBLZT8-unsplash.jpg;
  };

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    settings = {
      # Monitor configuration
      monitor = [
        "eDP-1, 2560x1600@60, 0x0, 1.6"
      ];
    };
  };

  # Wallpaper utility
  services.hyprpaper = {
    settings = {
      wallpaper = [
        "eDP-1,/home/${userConfig.username}/.config/wallpaper.jpg"
      ];
    };
  };
}
