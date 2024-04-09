{
  # Screen locking utility
  programs.hyprlock = {
    enable = true;

    general = {
      hide_cursor  = true;
      grace = 5;
    };

    backgrounds = [
      {
        path = "screenshot";
        blur_passes = 2;
        blur_size = 8;
        vibrancy = 0.2;
      }
    ];

    input-fields = [
      {
        size = {
          width = 300;
        };

        rounding = 4;
        fail_text = "<i>$FAIL <b>[$ATTEMPTS]</b></i>";

        position = {
          y = -80;
        };
      }
    ];

    labels = [
      {
        text = "$TIME";
        font_size = 60;
      }
    ];
  }; 
}
