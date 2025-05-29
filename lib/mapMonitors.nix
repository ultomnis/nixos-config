{
  mapSwayMonitors =
    monitors:
    builtins.listToAttrs (
      map (monitor: {
        name = monitor.output;

        value = {
          mode = "${toString monitor.height}x${toString monitor.width}@${toString monitor.rate}Hz";
          pos = "${toString monitor.pos_x} ${toString monitor.pos_y}";
          scale = toString monitor.scale;
        };
      }) monitors
    );
}
