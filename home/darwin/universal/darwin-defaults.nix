{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.universal.darwinDefaults;

in
{
  config = lib.mkIf cfg.enable {
    # macOS settings
    targets.darwin.defaults = {
      "com.apple.AppleMultitouchTrackpad" = {
        Clicking = true;
        Dragging = true;
      };

      "com.apple.dock" = {
        autohide = true;
        show-recents = false;
        static-only = true;
      };

      "com.apple.spaces" = {
        spans-displays = true;
      };

      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
      };
    };
  };
}
