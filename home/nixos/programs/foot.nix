{
  # Wayland terminal emulator
  programs.foot = {
    enable = true;

    # Configuration
    settings = {
      bell = {
        urgent = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
