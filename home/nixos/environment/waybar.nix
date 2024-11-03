{ pkgs, ... }:

{
  # Wayland status bar
  programs.waybar = {
    enable = true;

    # Waybar configuration
    settings = {
      mainBar = {
        layer = "top";
        height = 30;
        spacing = 0;

        # Order of modules
        modules-left = [ "custom/power" "sway/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "network" "pulseaudio#output" "pulseaudio#input" ];

        # Modules configuration
        "custom/power" = {
          format = "<span font='11'></span>";
          tooltip = false;
          menu = "on-click";
          menu-file = pkgs.writeText "power_menu.xml"
            ''
              <?xml version="1.0" encoding="UTF-8"?>
              <interface>
                <object class="GtkMenu" id="menu">
                  <child>
                    <object class="GtkMenuItem" id="lock">
                      <property name="label">Lock</property>
                    </object>
                  </child>
                  <child>
                    <object class="GtkMenuItem" id="logout">
                      <property name="label">Logout</property>
                    </object>
                  </child>
                  <child>
                    <object class="GtkMenuItem" id="reboot">
                      <property name="label">Reboot</property>
                    </object>
                  </child>
                  <child>
                    <object class="GtkMenuItem" id="shutdown">
                      <property name="label">Shutdown</property>
                    </object>
                  </child>
                </object>
              </interface>
            '';
          menu-actions = {
            "lock" = "${pkgs.swaylock}/bin/swaylock -f";
            "logout" = "${pkgs.systemd}/bin/loginctl terminate-user $USER";
            "reboot" = "${pkgs.systemd}/bin/systemctl reboot";
            "shutdown" = "${pkgs.systemd}/bin/systemctl poweroff";
          };
        };
        
        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{icon}";
          format-icons = {
            "1" = "I";
            "2" = "II";
            "3" = "III";
            "4" = "IV";
            "5" = "V";
            "6" = "VI";
            "7" = "VII";
            "8" = "VIII";
            "9" = "IX";
            "10" = "X";
          };
        };

        "clock" = {
          format = "{:%a %b %d %H:%M}";
          tooltip = false;
        };

        "tray" = {
          icon-size = 16;
          spacing = 8;
          reverse-direction = true;
        };

        "network" = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
        };

        "pulseaudio#output" = {
          format = "<span font='10'>{icon}</span> {volume}%";
          format-muted = "<span font='10'></span>";
          format-icons = [ "" "" "" ];
          scroll-step = 1;
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

        "pulseaudio#input" = {
          format = "{format_source}";
          format-source = "<span font='10'></span> {volume}%";
          format-source-muted = "<span font='10'></span>";
          on-scroll-up = "${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 1%+";
          on-scroll-down = "${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 1%-";
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };
      };
    };

    # CSS
    style = ''
      button {
        border: none;
        border-radius: 0;
      }

      #workspaces button {
        padding: 3px 5px 0;
      }

      #custom-power,
      #tray,
      #pulseaudio.output,
      #pulseaudio.input {
        padding: 0 5px;
      }
    '';
  };
}
