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
    file.".config/sky.jpg".source = ../../assets/wallpapers/michael-diane-weidner-u8X0HCV2X1Y-unsplash.jpg;
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
      "~/.config/sky.jpg"
    ];

    wallpapers = [
      "eDP-1,~/.config/sky.jpg"
    ];
  };
}
