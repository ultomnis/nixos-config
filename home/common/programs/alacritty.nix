{
  # Terminal emulator
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding = {
          x = 4;
          y = 4;
        };
        decorations = "Buttonless";
        opacity = 0.8;
      };

      font = {
        size = 13;
      };

      colors = {
        primary = {
          background = "#000000";
        };
      };
    };
  };
}
