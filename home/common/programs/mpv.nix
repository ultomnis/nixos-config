{ pkgs, ... }:

{
  # Media player
  programs.mpv = {
    enable = true;

    config = {
      deband = "no";
      keep-open = "yes";
      osd-bar = "no";
      profile = "high-quality";
      vo = "gpu-next";
      volume = 50;
    };

    scripts = with pkgs.mpvScripts; [
      uosc
    ];
  };
}
