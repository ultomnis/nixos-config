{
  # macOS tiling window manager
  services.aerospace = {
    enable = true;

    settings = {  
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
  
      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
      on-focus-changed = [ "move-mouse window-lazy-center" ];

      gaps = {
        inner.horizontal = 10;
        inner.vertical = 10;
        outer.left = 10;
        outer.bottom = 10;
        outer.top = 10;
        outer.right = 10;
      };

      mode.main.binding = {
        alt-enter = "exec-and-forget open -n /System/Applications/Utilities/Terminal.app";

        alt-left = "focus left";
        alt-down = "focus down";
        alt-up = "focus up";
        alt-right = "focus right";
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-shift-left = [ "move left" "join-with left" "mode main" ];
        alt-shift-down = [ "move down" "join-with down" "mode main" ];
        alt-shift-up = [ "move up" "join-with up" "mode main" ];
        alt-shift-right = [ "move right" "join-with right" "mode main" ];
        alt-shift-h = [ "move left" "join-with left" "mode main" ];
        alt-shift-j = [ "move down" "join-with down" "mode main" ];
        alt-shift-k = [ "move up" "join-with up" "mode main" ];
        alt-shift-l = [ "move right" "join-with right" "mode main" ];

        alt-f = "fullscreen";

        alt-s = "layout v_accordion";
        alt-w = "layout h_accordion";
        alt-e = "layout tiles horizontal vertical";

        alt-shift-space = "layout floating tiling";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-0 = "workspace 10";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";
        alt-shift-0 = "move-node-to-workspace 10";

        alt-shift-c = "reload-config";

        alt-r = "mode resize";
      };

      mode.resize.binding = {
        left = "resize width -50";
        down = "resize height +50";
        up = "resize height -50";
        right = "resize width +50";
        h = "resize width -50";
        j = "resize height +50";
        k = "resize height -50";
        l = "resize width +50";
        enter = "mode main";
        esc = "mode main";
      };
    };
  };
}
