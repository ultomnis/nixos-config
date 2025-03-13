{
  extraConfig,
  lib,
  pkgs,
  ...
}:

{
  # Terminal emulator
  programs.ghostty = {
    enable = true;
    package = lib.mkIf pkgs.stdenv.isDarwin null;

    settings = {
      cursor-style = "block";
      cursor-style-blink = false;
      font-family = "Hack Nerd Font Mono";
      gtk-titlebar = false;
      mouse-hide-while-typing = true;
      resize-overlay = "never";
      shell-integration-features = "no-cursor";
      theme = "rose-pine";
    } // extraConfig.ghostty or { };
  };
}
