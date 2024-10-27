{
  # Wayland terminal emulator
  programs.foot = {
    enable = true;

    # Configuration
    settings = {
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
