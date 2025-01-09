{
  # Terminal emulator
  programs.ghostty = {
    enable = true;

    settings = {
      cursor-style = "block";
      cursor-style-blink = false;
      font-family = "Hack Nerd Font Mono";
      font-size = 11;
      gtk-titlebar = false;
      mouse-hide-while-typing = true;
      shell-integration-features = "no-cursor";
      theme = "rose-pine";
    };
  };
}
