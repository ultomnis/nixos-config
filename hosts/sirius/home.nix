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
  };

  programs.home-manager.enable = true;

  wayland.windowManager.sway = {
    config = {
      # Monitor configuration
      output = {
        "*" = {
          bg = "${../../assets/wallpapers/kemo-sahab-4V0tz5FEvTc-unsplash.jpg} fill";
        };

        DP-2 = {
          mode = "1920x1080@165Hz";
        };
      };
    };
  };

  programs.swaylock = {
    settings = {
      image = "${../../assets/wallpapers/kemo-sahab-4V0tz5FEvTc-unsplash.jpg}";
      scaling = "fill";
    };
  };
}
