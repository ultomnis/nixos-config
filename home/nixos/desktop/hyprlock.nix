{ config, ... }:

{
  # Screen locking utility
  programs.hyprlock = {
    enable = true;

    settings = {
      background = [
        {
          path = "${config.home.homeDirectory}/.config/wallpaper.jpg";
        }
      ];
    
      general = {
        hide_cursor  = true;
        grace = 5;
      };

      input-field = [
        {
          size = "300, 50";
          outline_thickness = 0;
          inner_color = "rgba(15, 15, 15, 0.8)";
          font_color = "rgba(240, 240, 240, 1.0)";
          placeholder_text = "Enter Password";
          rounding = -1;
          fail_text = "$FAIL <b>[$ATTEMPTS]</b>";
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
        {
          text = "cmd[update:1000] echo -e \"$(date +\"%A, %B %d\")\""; # Update in ms
          font_size = 30;
          position = "0, 160";
          halign = "center";
          valign = "center";
        }
      ];
    };
  }; 
}
