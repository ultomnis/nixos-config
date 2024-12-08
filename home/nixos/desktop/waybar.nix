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
        modules-left = [
          "custom/menu"
          "sway/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "network"
          "pulseaudio#output"
          "pulseaudio#input"
        ];

        # Modules configuration
        "custom/menu" = {
          format = "<span color=\"#cccccc\">APPS</span>";
          tooltip = false;
          on-click = "${pkgs.fuzzel}/bin/fuzzel --anchor top-left --icon-theme=kora";
        };

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

        "clock" = {
          format = "{:%a %b %d %H:%M}";
          tooltip = false;
        };

        "tray" = {
          icon-size = 16;
          spacing = 11;
          reverse-direction = true;
        };

        "network" = {
          format-wifi = "<span color=\"#cccccc\">WIFI</span>";
          format-ethernet = "<span color=\"#cccccc\">ETH</span>";
          format-disconnected = "";
          tooltip = false;
          on-click = "${pkgs.foot}/bin/foot -a nmtui ${pkgs.networkmanager}/bin/nmtui-connect";
          on-click-right = "${pkgs.foot}/bin/foot -a nmtui ${pkgs.networkmanager}/bin/nmtui-edit";
        };

        "pulseaudio#output" = {
          format = "<span color=\"#cccccc\">VOL</span> {volume}%";
          format-muted = "<span color=\"#cccccc\">VOL MUTE</span>";
          tooltip = false;
          scroll-step = 2;
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

        "pulseaudio#input" = {
          format = "{format_source}";
          format-source = "<span color=\"#cccccc\">MIC</span> {volume}%";
          format-source-muted = "<span color=\"#cccccc\">MIC MUTE</span>";
          tooltip = false;
          on-scroll-up = "${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%+";
          on-scroll-down = "${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 2%-";
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };
      };
    };

    # CSS
    style = ''
      * {
        font-family: 'Hack Nerd Font Propo';
        font-size: 14px;
      }

      window#waybar {
        background-color: rgba (0, 0, 0, 0.1);
        color: #ffffff;
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
        color: #ffffff;
      }

      #workspaces button:hover {
        background: rgba (255, 255, 255, 0.1);
      }

      #workspaces button.focused {
        box-shadow: inset 0 -2px #ffffff;
      }

      #workspaces button.urgent {
        color: #cc3333;
      }

      #custom-menu,
      #clock,
      #tray,
      #network,
      #pulseaudio.output,
      #pulseaudio.input {
        padding: 0 7px;
        color: #ffffff;
      }
    '';
  };
}
