{
  mapSwayMonitors =
    monitors:
    builtins.listToAttrs (
      map (monitor: {
        name = monitor.name;

        value = {
          mode = "${monitor.resolution}@${monitor.rate}Hz";
          pos = "${monitor.pos_x} ${monitor.pos_y}";
          scale = monitor.scale;
        };
      }) monitors
    );
}
