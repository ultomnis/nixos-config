{ userConfig, ... }:

{
  imports = [
    ../../home
  ];

  home = {
    username = "${userConfig.username}";
    homeDirectory = "/home/${userConfig.username}";
    stateVersion = "24.05";
    # Source the wallpaper file
    file.".config/wallpaper.jpg".source = ../../assets/wallpapers/matt-wang-FaFZCtl1yug-unsplash.jpg;
  };

  programs.home-manager.enable = true;

  # Hyprland
  wayland.windowManager.hyprland.settings = {
    # Configure monitor
    monitor = "eDP-1, 2560x1600@60, 0x0, 1.6";
  };
}
