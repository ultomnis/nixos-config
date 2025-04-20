{ config, lib, ... }:

let
  cfg = config.luminosity.system.configurations.darwin;

in
{
  config = lib.mkIf cfg.enable {
    # macOS settings
    system = {
      startup.chime = false; # Disable startup chime

      defaults = {
        dock = {
          autohide = true;
          mru-spaces = false; # Do not automatically rearrange spaces
          show-recents = false;
          static-only = true; # Show open applications only
          wvous-br-corner = 1; # Disable bottom-right hot corner
        };

        finder = {
          AppleShowAllExtensions = true; # Show file extensions
          AppleShowAllFiles = true; # Show hidden files
        };

        menuExtraClock = {
          Show24Hour = true;
          ShowAMPM = false;
        };

        spaces = {
          spans-displays = true; # Disable displays have separate spaces
        };

        trackpad = {
          Clicking = true; # Tap to click
          Dragging = true; # Use trackpad for dragging
        };
      };
    };
  };
}
