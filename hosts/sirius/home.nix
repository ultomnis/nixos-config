{ config, userConfig, ... }:

{
  imports = [
    ../../home/common
    ../../home/nixos
  ];

  home = {
    username = "${userConfig.username}";
    homeDirectory = "/home/${userConfig.username}";
    stateVersion = "24.05";
    # Source the wallpaper
    file.".config/wallpaper.jpg".source = ../../assets/wallpapers/ernest-brillo-JNe3j45DzOU-unsplash.jpg;
  };

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    settings = {
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
        "DP-2,${config.home.homeDirectory}/.config/wallpaper.jpg"
      ];
    };
  };
}
