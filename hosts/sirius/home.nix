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

  services.ollama = {
    environmentVariables = {
      HSA_OVERRIDE_GFX_VERSION = "11.0.1";
    };
  };

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
