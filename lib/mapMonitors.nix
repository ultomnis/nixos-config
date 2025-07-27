{
  mapSwayMonitors =
    monitors:
    monitors
    |> map (monitor: {
      inherit (monitor) name;

      value = {
        mode = "${toString monitor.width}x${toString monitor.height}@${toString monitor.rate}Hz";
        pos = "${toString monitor.pos_x} ${toString monitor.pos_y}";
        scale = toString monitor.scale;
      };
    })
    |> builtins.listToAttrs;
}
