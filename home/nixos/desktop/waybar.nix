{ pkgs, ... }:

{
  # Wayland status bar
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        height = 30;
        spacing = 0;

        modules-left = [
          "sway/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "network"
          "wireplumber"
        ];

        "sway/workspaces" = {
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

        clock = {
          format = "{:%a %b %d %H:%M}";
          tooltip = false;
        };

        tray = {
          icon-size = 16;
          spacing = 11;
          reverse-direction = true;
        };

        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          tooltip = false;
        };

        wireplumber = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = [
            ""
            ""
            ""
          ];
          tooltip = false;
          scroll-step = 2;
          on-click = "${pkgs.pwvucontrol}/bin/pwvucontrol";
          on-click-right = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
      };
    };

    style = ''
      window#waybar {
        background-color: rgba (0, 0, 0, 0.1);
      }

      button {
        box-shadow: inset 0 -2px transparent;
        border: none;
        border-radius: 0;
      }

      button:hover {
        background: inherit;
      }

      #workspaces button {
        padding: 0 7px;
        transition: none;
        color: #ffffff;
      }

      #workspaces button:hover {
        background: rgba (255, 255, 255, 0.1);
      }

      #workspaces button.focused {
        box-shadow: inset 0 -2px #ffffff;
      }

      #clock,
      #tray,
      #network,
      #wireplumber {
        padding: 0 7px;
      }
    '';
  };
}
