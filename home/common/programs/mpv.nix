{ pkgs, ... }:

{
  # Media player
  programs.mpv = {
    enable = true;

    config = {
      border = "no";
      keep-open = "yes";
      osd-bar = "no";
      profile = "high-quality";
      video-sync = "display-resample";
      vo = "gpu-next";
      volume = 50;
    };

    scripts = with pkgs.mpvScripts; [
      thumbfast
      uosc
    ];

    scriptOpts = {
      uosc = {
        progress = "never";
        window_border_size = 0;
      };
    };
  };
}
