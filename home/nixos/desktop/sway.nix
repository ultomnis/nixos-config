{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Wayland tiling compositor
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;

    config = {
      modifier = "Mod4";
      terminal = "${pkgs.foot}/bin/foot";
      menu = "${pkgs.fuzzel}/bin/fuzzel";
      defaultWorkspace = "workspace number 1";

      startup = [
        {
          command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        }
      ];

      input = {
        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "0";
        };
      };

      output = {
        "*" = {
          allow_tearing = "yes";
          max_render_time = "off";
        };
      };

      window = {
        commands = [
          {
            command = "allow_tearing yes";
            criteria = {
              class = "cs2";
            };
          }
          {
            command = "floating on, resize set 800 600, move position cursor, move down 30 px";
            criteria = {
              app_id = "nmtui";
            };
          }
          {
            command = "floating on, resize set 800 600, move position cursor, move down 30 px";
            criteria = {
              app_id = "pwvucontrol";
            };
          }
        ];
      };

      focus = {
        mouseWarping = "container";
        wrapping = "yes";
      };

      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in
        lib.mkOptionDefault {
          "--no-repeat ${modifier}+Print" = ''exec ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)"'';

          "${modifier}+Escape" = "exec ${pkgs.swaylock}/bin/swaylock -f";

          "--locked XF86AudioMute" =
            "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "--locked XF86AudioLowerVolume" =
            "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "--locked XF86AudioRaiseVolume" =
            "exec ${pkgs.wireplumber}/bin/wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
          "--locked XF86AudioMicMute" =
            "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

          "--locked XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
          "--locked XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
          "--locked XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
          "--locked XF86AudioStop" = "exec ${pkgs.playerctl}/bin/playerctl stop";
        };

      gaps = {
        inner = 5;
      };

      bars = [
        {
          command = "${pkgs.waybar}/bin/waybar";
        }
      ];
    };

    extraConfig = ''
      default_border pixel 0
      default_floating_border pixel 0
    '';
  };
}
