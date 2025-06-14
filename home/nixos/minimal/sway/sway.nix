{
  config,
  customLib,
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.minimal.sway;
  monitors = osConfig.luminosity.selections.monitors or config.luminosity.selections.monitors;
  terminal = osConfig.luminosity.selections.terminal or config.luminosity.selections.terminal;
  wallpaper = osConfig.luminosity.selections.wallpaper or config.luminosity.selections.wallpaper;

in
{
  config = lib.mkIf cfg.enable {
    # Tiling Wayland compositor
    wayland.windowManager.sway = {
      enable = true;

      config = {
        modifier = "Mod4";
        terminal = lib.mkIf (terminal != null) (lib.getExe pkgs.${terminal});
        menu = lib.getExe pkgs.fuzzel;
        defaultWorkspace = "workspace number 1";

        input = {
          "type:pointer" = {
            accel_profile = "flat";
            pointer_accel = "0";
          };
        };

        output =
          {
            "*" = {
              allow_tearing = "yes";
              bg = lib.mkIf (wallpaper != null) "${wallpaper} fill";
              max_render_time = "off";
            };
          }
          |> lib.recursiveUpdate (customLib.mapSwayMonitors monitors);

        window = {
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
                app_id = "pwvucontrol";
              };
            }
          ];
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

            "${mod}+1" = "workspace number 1";
            "${mod}+2" = "workspace number 2";
            "${mod}+3" = "workspace number 3";
            "${mod}+4" = "workspace number 4";
            "${mod}+5" = "workspace number 5";
            "${mod}+6" = "workspace number 6";
            "${mod}+7" = "workspace number 7";
            "${mod}+8" = "workspace number 8";
            "${mod}+9" = "workspace number 9";
            "${mod}+0" = "workspace number 10";

            "${mod}+Shift+1" = "move container to workspace number 1";
            "${mod}+Shift+2" = "move container to workspace number 2";
            "${mod}+Shift+3" = "move container to workspace number 3";
            "${mod}+Shift+4" = "move container to workspace number 4";
            "${mod}+Shift+5" = "move container to workspace number 5";
            "${mod}+Shift+6" = "move container to workspace number 6";
            "${mod}+Shift+7" = "move container to workspace number 7";
            "${mod}+Shift+8" = "move container to workspace number 8";
            "${mod}+Shift+9" = "move container to workspace number 9";
            "${mod}+Shift+0" = "move container to workspace number 10";

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

            "--locked XF86MonBrightnessDown" = "exec ${lib.getExe pkgs.brightnessctl} set 5%-";
            "--locked XF86MonBrightnessUp" = "exec ${lib.getExe pkgs.brightnessctl} set 5%+";

            "--no-repeat ${mod}+Print" = ''exec ${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp})"'';
          };

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
          command = lib.getExe pkgs.waybar;
        };
      };
    };
  };
}
