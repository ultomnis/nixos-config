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
    file.".config/wallpaper.jpg".source = ../../assets/wallpapers/michael-diane-weidner-u8X0HCV2X1Y-unsplash.jpg;
  };

  programs.home-manager.enable = true;

  wayland.windowManager.sway = {
    config = {
      # Monitor configuration
      output = {
        DP-2 = {
          allow_tearing = "yes";
          bg = "${config.home.homeDirectory}/.config/wallpaper.jpg fill";
          max_render_time = "off";
          mode = "1920x1080@165Hz";
        };
      };
    };
  };
}
