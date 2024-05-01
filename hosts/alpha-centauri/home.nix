{ pkgs, userConfig, ... }:

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
      # Execute on launch
      exec-once = [
        "${pkgs.wvkbd}/bin/wvkbd-mobintl & ${pkgs.coreutils}/bin/sleep 5 && ${pkgs.killall}/bin/killall -34 ${pkgs.wvkbd}/bin/wvkbd-mobintl"
        "${pkgs.coreutils}/bin/sleep 5 && ${pkgs.xorg.xrandr}/bin/xrandr --output DP-1 --primary"
      ];
    
      # Touchscreen input
      input = {
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
    enable = true;

    preloads = [
      "~/.config/ocean.jpg"
    ];

    wallpapers = [
      "eDP-1,~/.config/ocean.jpg"
      "DP-1,~/.config/ocean.jpg"
    ];
  };
}
