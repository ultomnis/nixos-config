{
  # Wayland terminal emulator
  programs.foot = {
    enable = true;

    # Configuration
    settings = {
      main = {
        font = "monospace:size=12";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        alpha = "0.75";
        background = "000000";
      };
    };
  };
}
