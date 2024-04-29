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
    file.".config/ocean.jpg".source = ../../assets/wallpapers/johannes-plenio-DKix6Un55mw-unsplash.jpg;
  };

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    settings = {
      # Monitor configuration
      monitor = [
        "eDP-1, 800x1280@60, 0x0, 1, transform, 3"
      ];
    };
  };
  
  # Wallpaper utility
  services.hyprpaper = {
    enable = true;

    preloads = [
      "~/.config/ocean.jpg"
    ];

    wallpapers = [
      "eDP-1,~/.config/ocean.jpg"
    ];
  };
}
