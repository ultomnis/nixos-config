{ userConfig, ... }:

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

  wayland.windowManager.sway = {
    config = {
      # Monitor configuration
      output = {
        DP-2 = {
          allow_tearing = "yes";
          max_render_time = "off";
          mode = "1920x1080@165Hz";
        };
      };
    };
  };
}
