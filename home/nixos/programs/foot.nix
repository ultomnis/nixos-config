{
  # Wayland terminal emulator
  programs.foot = {
    enable = true;

    # Configuration
    settings = {
      main = {
        font = "monospace:size=11";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        alpha = "0.5";
        background = "000000";
      };
    };
  };
}
