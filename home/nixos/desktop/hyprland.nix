{ inputs, pkgs, ... }: 

{
  # Wayland tiling compositor
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    settings = {
      # Execute on launch
      exec-once = [
        "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent"
        "${pkgs.hyprsunset}/bin/hyprsunset"
        "${pkgs.waybar}/bin/waybar"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        
        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.5;
        };
        
        sensitivity = 0;
        accel_profile = "flat";
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(f0f0f0cc)";
        "col.inactive_border" = "rgba(ffffff00)";
        layout = "dwindle";
        allow_tearing = true;
      };

      decoration = {
        rounding = 4;
        
        blur = {
          enabled = true;
          size = 12;
          passes = 4;
          xray = true;
        };
        
        shadow = {
          enabled = false;
        };
      };

      animations = {
        enabled = true;
        bezier = "easeOutCubic, 0.33, 1, 0.68, 1";
        
        animation = [
          "windows, 1, 4, easeOutCubic"
          "border, 1, 8, default"
          "fade, 1, 8, default"
          "workspaces, 1, 4, default, slidefade 40%"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      gestures = {
        workspace_swipe = false;
      };

      misc = {
        force_default_wallpaper = 0;
      };

      # Layerrules
      layerrule = [
        "blur, launcher"
        "ignorealpha 0.5, launcher"
        "blur, notifications"
        "ignorealpha 0, notifications"
        "blur, waybar"
        "ignorealpha 0, waybar"
      ];

      # Windowrules
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "immediate, class:^(cs2)$"
      ];

      # SUPER key
      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Return, exec, ${pkgs.foot}/bin/foot"
        "$mainMod, Q, killactive"
        "$mainMod SHIFT, E, exit"
        "$mainMod, Escape, exec, ${pkgs.systemd}/bin/loginctl lock-session"
        "$mainMod, Space, togglefloating"
        "$mainMod, D, exec, ${pkgs.fuzzel}/bin/fuzzel"
        "$mainMod, P, pseudo"
        "$mainMod, V, togglesplit"
        "$mainMod, F, fullscreen"
        "$mainMod, W, exec, ${pkgs.killall}/bin/killall -SIGUSR1 .waybar-wrapped"
        "$mainMod, N, exec, ${pkgs.hyprsunset}/bin/hyprsunset -t 3400"
        "$mainMod, M, exec, ${pkgs.hyprsunset}/bin/hyprsunset"
        "$mainMod, Print, exec, ${pkgs.procps}/bin/pidof ${pkgs.slurp}/bin/slurp || ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\""

        # Focus binds
        "$mainMod, left, movefocus, l"
        "$mainMod, down, movefocus, d"
        "$mainMod, up, movefocus, u"
        "$mainMod, right, movefocus, r"
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

        # Workspace binds
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move window to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Scratchpad
        "$mainMod, Minus, togglespecialworkspace, magic"
        "$mainMod SHIFT, Minus, movetoworkspace, special:magic"

        # Scroll through workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Move windows
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, J, movewindow, d"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, L, movewindow, r"
      ];

      # Move and resize windows
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ", XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioMicMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bindl = [
        ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
        ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioStop, exec, ${pkgs.playerctl}/bin/playerctl stop"
      ];
    };

    extraConfig = ''
      # Switch to resize submap
      bind = ALT, R, submap, resize
      # Start resize submap
      submap = resize
      # Repeatable binds
      binde = , left, resizeactive, -10 0
      binde = , right, resizeactive, 10 0
      binde = , up, resizeactive, 0 -10
      binde = , down, resizeactive, 0 10
      # Switch to global submap
      bind = , escape, submap, reset
      # Reset submap
      submap = reset
    '';
  };
}
