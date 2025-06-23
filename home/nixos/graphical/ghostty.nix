{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.ghostty;

in
{
  # Terminal emulator
  programs.ghostty = {
    inherit (cfg) enable;

    settings = {
      background = "000000";
      background-opacity = 0.6;
      background-blur = 60;
      command = lib.mkIf (cfg.shell != null) (lib.getExe pkgs.${cfg.shell});
      cursor-style = "block";
      cursor-style-blink = false;
      font-family = lib.mkIf (cfg.font.name != null) cfg.font.name;
      font-size = lib.mkIf (cfg.font.size != null) cfg.font.size;
      foreground = "ffffff";
      macos-titlebar-style = "tabs";
      mouse-hide-while-typing = true;
      quit-after-last-window-closed = true;
      resize-overlay = "never";
      shell-integration-features = "no-cursor";
      theme = lib.mkIf (cfg.theme != null) cfg.theme;
      window-padding-x = 5;
      window-padding-y = 5;
    };
  };
}
