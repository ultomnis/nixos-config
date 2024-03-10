{ pkgs, ... }:

{
  # Wayland screen locker
  programs.swaylock = {
    enable = true;

    # Additional effects
    package = pkgs.swaylock-effects;

    settings = {
      clock = true;
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      fade-in = 1;
      grace = 5;
      indicator-idle-visible = true;
      screenshots = true;
    };
  };
}
