{ userConfig, ... }:

{
  # Screen locking utility
  programs.hyprlock = {
    enable = true;

    settings = {
      background = [
        {
          path = "/home/${userConfig.username}/.config/wallpaper.jpg";
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
          inner_color = "rgba(0, 0, 0, 0.5)";
          font_color = "rgb(240, 240, 240)";
          placeholder_text = "<i><span foreground='##f0f0f0'>Enter Password</span></i>";
          rounding = -1;
          fail_text = "<i><span foreground='##f0f0f0'>$FAIL <b>[$ATTEMPTS]</b></span></i>";
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
          text = "cmd[update:1000] echo -e \"$(date +\"%A, %B %d\")\"";
          font_size = 30;
          position = "0, 160";
          halign = "center";
          valign = "center";
        }
      ];
    };
  }; 
}
