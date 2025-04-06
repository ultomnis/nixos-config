{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  # Tiling Wayland compositor
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;

    config = {
      modifier = "Mod4";
      terminal = "${lib.getExe pkgs.wezterm}";
      menu = "${lib.getExe pkgs.fuzzel}";
      defaultWorkspace = "workspace number 1";

      input = {
        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "0";
        };
      };

      output =
        let
          wallpaper = "${inputs.self}/assets/wallpaper.jpg";
        in
        {
          "*" = {
            allow_tearing = "yes";
            bg = "${wallpaper} fill";
            max_render_time = "off";
          };
        };

      window = {
        border = 0;
        titlebar = false;

        commands = [
          {
            command = "allow_tearing yes";
            criteria = {
              class = "cs2";
            };
          }
          {
            command = "floating enable, move position center";
            criteria = {
              app_id = "pavucontrol";
            };
          }
        ];
      };

      floating = {
        border = 0;
        titlebar = false;
      };

      focus = {
        wrapping = "yes";
      };

      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in
        lib.mkOptionDefault {
          "--no-repeat ${modifier}+Print" = ''exec ${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp})"'';

          "${modifier}+Escape" = "exec ${lib.getExe pkgs.swaylock} -f";

          "--locked XF86AudioMute" =
            "exec ${lib.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "--locked XF86AudioLowerVolume" =
            "exec ${lib.getExe' pkgs.wireplumber "wpctl"} set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "--locked XF86AudioRaiseVolume" =
            "exec ${lib.getExe' pkgs.wireplumber "wpctl"} set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
          "--locked XF86AudioMicMute" =
            "exec ${lib.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

          "--locked XF86AudioPrev" = "exec ${lib.getExe pkgs.playerctl} previous";
          "--locked XF86AudioNext" = "exec ${lib.getExe pkgs.playerctl} next";
          "--locked XF86AudioPlay" = "exec ${lib.getExe pkgs.playerctl} play-pause";
          "--locked XF86AudioStop" = "exec ${lib.getExe pkgs.playerctl} stop";
        };

      gaps = {
        inner = 5;
      };

      bars = [
        {
          command = "${lib.getExe pkgs.waybar}";
        }
      ];
    };
  };
}
