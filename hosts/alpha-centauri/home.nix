{ userConfig, ... }:

{
  imports = [
    ../../home
  ];

  home = {
    username = "${userConfig.username}";
    homeDirectory = "/home/${userConfig.username}";
    stateVersion = "23.11";
    # Source the wallpaper
    file.".config/wallpaper.jpg".source = ../../assets/wallpapers/johannes-plenio-DKix6Un55mw-unsplash.jpg;
  };

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    settings = {
      input = {
        # Touchscreen input
        touchdevice = {
          transform = 3;
        };
      };
      
      # Monitor configuration
      monitor = [
        "eDP-1, 800x1280@60, 0x0, 1, transform, 3"
        "DP-1, 1920x1080@165, 1280x0, 1"
      ];
    };
  };
  
  # Wallpaper utility
  services.hyprpaper = {
    settings = {
      wallpaper = [
        "eDP-1,/home/${userConfig.username}/.config/wallpaper.jpg"
        "DP-1,/home/${userConfig.username}/.config/wallpaper.jpg"
      ];
    };
  };
}
