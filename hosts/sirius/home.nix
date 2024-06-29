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
    file.".config/wallpaper.jpg".source = ../../assets/wallpapers/michael-diane-weidner-u8X0HCV2X1Y-unsplash.jpg;
  };

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    settings = {
      # Environment variables
      env = [
        "WLR_DRM_NO_ATOMIC,1"
      ];
      
      # Monitor configuration
      monitor = [
        "DP-2, 1920x1080@165, 0x0, 1"
      ];
    };
  };
  
  # Wallpaper utility
  services.hyprpaper = {
    settings = {
      wallpaper = [
        "DP-2,~/.config/wallpaper.jpg"
      ];
    };
  };
}
