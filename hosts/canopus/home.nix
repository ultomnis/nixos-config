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
    file.".config/mountains.jpg".source = ../../assets/wallpapers/matt-wang-FaFZCtl1yug-unsplash.jpg;
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

  # Screen locking utility
  programs.hyprlock = {
    settings = {
      background = [
        {
          path = "~/.config/mountains.jpg";
        }
      ];
    };
  };

  # Wallpaper utility
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "~/.config/mountains.jpg"
      ];

      wallpaper = [
        "eDP-1,~/.config/mountains.jpg"
      ];

      splash = false;
    };
  };
}
