{ lib, pkgs, ... }:

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
      macos-titlebar-style = "hidden";
      mouse-hide-while-typing = true;
      quit-after-last-window-closed = true;
      resize-overlay = "never";
      shell-integration-features = "no-cursor";
      theme = "rose-pine";
      window-save-state = "never";
    };
  };
}
