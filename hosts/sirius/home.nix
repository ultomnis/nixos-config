{ userConfig, ... }:

{
  imports = [
    ../../home/common
    ../../home/nixos
  ];

  home = {
    username = "${userConfig.name}";
    homeDirectory = "/home/${userConfig.name}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  wayland.windowManager.sway = {
    config = {
      # Monitor configuration
      output = {
        DP-2 = {
          mode = "1920x1080@165Hz";
        };
      };
    };
  };
}
