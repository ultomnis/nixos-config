{ config, ... }:

let
  cfg = config.luminosity.home.programs.graphical.mpv;

in
{
  # Media player
  programs.mpv = {
    inherit (cfg) enable;

    config = {
      # Program behavior
      profile = "high-quality";

      # Video
      vo = "gpu-next";

      # Audio
      volume = 80;

      # Window
      keep-open = "yes";

      # OSD
      osd-bar = "no";

      # GPU renderer options
      interpolation = "yes";

      # Miscellaneous
      video-sync = "display-resample";
    };
  };
}
