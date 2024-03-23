{ userConfig, ... }:

{
  imports = [
    ../../home
  ];

  home = {
    username = "${userConfig.username}";
    homeDirectory = "/home/${userConfig.username}";
    stateVersion = "23.05";
    # Source the wallpaper
    file.".config/sky.jpg".source = ../../assets/wallpapers/michael-diane-weidner-u8X0HCV2X1Y-unsplash.jpg;
  };

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    settings = {
      # Monitor configuration
      monitor = [
        "DP-3, 1920x1080@144, 0x0, 1"
      ];
    };
  };
  
  # Wallpaper utility
  services.hyprpaper = {
    enable = true;

    preloads = [
      "~/.config/sky.jpg"
    ];

    wallpapers = [
      "DP-3,~/.config/sky.jpg"
    ];
  };
}
