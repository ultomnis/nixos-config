{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.minimal.waybar;

in
{
  # Wayland status bar
  programs.waybar = {
    inherit (cfg) enable;

    settings = {
      mainBar = {
        layer = "top";
        height = 30;
        spacing = 0;

        modules-left = [
          "custom/menu"
          "sway/workspaces"
        ];

        modules-right = [
          "tray"
          "network"
          "wireplumber"
          "clock"
        ];

        "custom/menu" = {
          format = "";
          tooltip = false;
          on-click = lib.mkIf (cfg.menuCommand != null) cfg.menuCommand;
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
          on-click = lib.getExe pkgs.pwvucontrol;
          on-click-right = "${lib.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

        clock = {
          format = "{:%a %b %d %H:%M}";
          tooltip = false;
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

      #custom-menu,
      #tray,
      #network,
      #wireplumber,
      #clock {
        padding: 0 7px;
      }
    '';
  };
}
