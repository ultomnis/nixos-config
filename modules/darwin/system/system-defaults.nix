{ config, lib, ... }:

let
  cfg = config.luminosity.system.configurations.darwin;

in
{
  config = lib.mkIf cfg.enable {
    # macOS settings
    system = {
      startup.chime = false; # Whether to enable startup chime

      defaults = {
        dock = {
          autohide = true;
          show-recents = false;
          static-only = true; # Show open applications only
        };

        NSGlobalDomain = {
          AppleICUForce24HourTime = true;
          AppleInterfaceStyle = "Dark";
          AppleShowAllExtensions = true; # Show file extensions
          AppleShowAllFiles = true; # Show hidden files
        };

        spaces = {
          spans-displays = true; # Whether displays have separate spaces
        };

        trackpad = {
          Clicking = true; # Tap to click
          Dragging = true; # Use trackpad for dragging
        };
      };
    };
  };
}
