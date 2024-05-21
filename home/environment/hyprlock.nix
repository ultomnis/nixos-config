{
  # Screen locking utility
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor  = true;
        grace = 5;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 2;
          blur_size = 8;
          vibrancy = 0.2;
        }
      ];

      input-field = [
        {
          size = "300, 50";
          rounding = -1;
          position = "0, -80";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          text = "$TIME";
          font_size = 60;
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
      ];
    };
  }; 
}
