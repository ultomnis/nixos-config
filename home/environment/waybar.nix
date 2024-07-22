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
        spacing = 5;

        # Order of modules
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "network" "pulseaudio" "backlight" "battery" ];

        # Modules configuration
        "hyprland/workspaces" = {
          format = "{icon}";
          all-outputs = true;
          on-scroll-up = "${pkgs.hyprland}/bin/hyprctl dispatch workspace e+1";
          on-scroll-down = "${pkgs.hyprland}/bin/hyprctl dispatch workspace e-1";
          on-click = "activate";
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
          spacing = 10;
          reverse-direction = true;
        };

        "network" = {
          format-wifi = "󰖩";
          format-ethernet = "󰈀";
          format-disconnected = "";
          tooltip-format = "{essid}";
        };

        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          scroll-step = 1;
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          format-muted = "󰸈 {format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭";
          format-icons = [ "󰕿" "󰖀" "󰕾" ];
        };

        "backlight" = {
          format = "󰃠 {percent}%";
        };

        "battery" = {
          format = "{icon} {capacity}%";
          interval = 60;
          states = {
          warning = 20;
            critical = 10;
          };
          format-charging = "󱐋 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };
      };
    };

    # CSS
    style = ''
      window#waybar {
        background-color: rgba(0, 0, 0, 0.1);
        color: #f0f0f0;
      }

      button {
        border: none;
        border-radius: 0;
      }

      button:hover {
        background: inherit;
      }

      #workspaces button {
        padding: 0 6px;
        color: #f0f0f0;
      }

      #workspaces button:hover {
        color: #00cccc;
        box-shadow: inherit;
        text-shadow: inherit;
      }

      #workspaces button.active {
        box-shadow: inset 0 -2px #f0f0f0;
      }

      #workspaces button.urgent {
        color: #cc0000;
      }

      #clock,
      #tray,
      #network,
      #pulseaudio,
      #backlight,
      #battery {
        padding: 0 6px;
        color: #f0f0f0;
      }

      #window,
      #workspaces {
        margin: 0 4px;
      }

      .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
      }

      .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
      }

      #battery.charging, #battery.plugged {
        color: #00cc00;
      }

      #battery.critical:not(.charging) {
        color: #cc0000;
      }
    '';
  };
}
