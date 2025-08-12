{
  config,
  customLib,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.minimal.sway;

in
{
  # Tiling Wayland compositor
  wayland.windowManager.sway = {
    inherit (cfg) enable;

    config = {
      modifier = "Mod4";
      terminal = lib.mkIf (cfg.terminal != null) (lib.getExe pkgs.${cfg.terminal});
      menu = lib.getExe pkgs.fuzzel;
      defaultWorkspace = "workspace number 1";

      startup = lib.singleton {
        always = true;
        command = "${lib.getExe pkgs.darkman} set dark";
      };

      input = {
        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "0";
        };
      };

      output = lib.mkMerge [
        {
          "*" = {
            allow_tearing = "yes";
            max_render_time = "off";
          };
        }

        (customLib.mapSwayMonitors cfg.monitors)
      ];

      window = {
        titlebar = false;

        commands = lib.singleton {
          command = "allow_tearing yes";
          criteria.class = "cs2";
        };
      };

      floating = {
        titlebar = false;
      };

      focus = {
        followMouse = "no";
        wrapping = "yes";
      };

      gaps = {
        inner = 7;
      };

      keybindings =
        let
          menu = config.wayland.windowManager.sway.config.menu;
          mod = config.wayland.windowManager.sway.config.modifier;
          term = config.wayland.windowManager.sway.config.terminal;

        in
        lib.mkMerge [
          {
            "${mod}+Return" = "exec ${term}";
            "${mod}+Shift+q" = "kill";
            "${mod}+d" = "exec ${menu}";
            "${mod}+Shift+c" = "reload";

            "${mod}+h" = "focus left";
            "${mod}+j" = "focus down";
            "${mod}+k" = "focus up";
            "${mod}+l" = "focus right";

            "${mod}+Shift+h" = "move left";
            "${mod}+Shift+j" = "move down";
            "${mod}+Shift+k" = "move up";
            "${mod}+Shift+l" = "move right";

            "${mod}+b" = "splith";
            "${mod}+v" = "splitv";

            "${mod}+s" = "layout stacking";
            "${mod}+w" = "layout tabbed";
            "${mod}+e" = "layout toggle split";

            "${mod}+f" = "fullscreen";

            "${mod}+Shift+space" = "floating toggle";

            "${mod}+space" = "focus mode_toggle";

            "${mod}+a" = "focus parent";

            "${mod}+Shift+minus" = "move scratchpad";
            "${mod}+minus" = "scratchpad show";

            "${mod}+r" = "mode resize";

            "${mod}+Escape" = "exec ${lib.getExe pkgs.swaylock} -f";

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
            "--locked XF86AudioPause" = "exec ${lib.getExe pkgs.playerctl} play-pause";
            "--locked XF86AudioStop" = "exec ${lib.getExe pkgs.playerctl} stop";

            "--locked XF86MonBrightnessDown" = cfg.keybinds.brightnessDown;
            "--locked XF86MonBrightnessUp" = cfg.keybinds.brightnessUp;

            "--no-repeat ${mod}+Print" = ''exec ${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp})"'';
          }

          (
            (builtins.genList (x: x + 1) 10)
            |> builtins.concatMap (
              num:
              let
                key = if (num == 10) then "0" else toString num;

              in
              [
                {
                  name = "${mod}+${key}";
                  value = "workspace number ${toString num}";
                }
                {
                  name = "${mod}+Shift+${key}";
                  value = "move container to workspace number ${toString num}";
                }
              ]
            )
            |> builtins.listToAttrs
          )
        ];

      modes = {
        resize = {
          "h" = "resize shrink width 10px";
          "j" = "resize grow height 10px";
          "k" = "resize shrink height 10px";
          "l" = "resize grow width 10px";

          "Return" = "mode default";
          "Escape" = "mode default";
        };
      };

      bars = lib.singleton {
        command = lib.getExe' pkgs.sway "swaybar";
        position = "top";
        statusCommand = "${lib.getExe pkgs.i3status-rust} config-status.toml";
      };
    };
  };
}
