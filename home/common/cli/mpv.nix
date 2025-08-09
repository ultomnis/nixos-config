{ config, ... }:

let
  cfg = config.luminosity.home.cli.mpv;

in
{
  # Media player
  programs.mpv = {
    inherit (cfg) enable;

    config = {
      image-display-duration = "inf";
      interpolation = "yes";
      keep-open = "yes";
      osd-bar = "no";
      profile = "high-quality";
      video-sync = "display-resample";
      vo = "gpu-next";
      volume = 80;
    };
  };
}
