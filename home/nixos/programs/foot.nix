{
  # Wayland terminal emulator
  programs.foot = {
    enable = true;

    # Configuration
    settings = {
      main = {
        font = "Hack Nerd Font Mono:size=11";
      };

      bell = {
        urgent = "yes";
      };
      
      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        alpha = "0.8";
        background = "0f0f0f";
      };
    };
  };
}
