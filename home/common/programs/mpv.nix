{ pkgs, ... }:

{
  # Media player
  programs.mpv = {
    enable = true;

    package = pkgs.mpv-unwrapped.wrapper {
      mpv = pkgs.mpv-unwrapped.override { vulkanSupport = true; };
    };

    # mpv configuration
    config = {
      deband = "no";
      keep-open = "yes";
      osd-bar = "no";
      profile = "high-quality";
      vo = "gpu-next";
    };
  };
}
