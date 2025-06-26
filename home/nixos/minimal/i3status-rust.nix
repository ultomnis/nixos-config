{ config, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.i3status-rust;

in
{
  # i3status replacement written in Rust
  programs.i3status-rust = {
    inherit (cfg) enable;

    bars = {
      status = {
        blocks = [
          {
            block = "net";
            format = " $icon ";
          }
          {
            block = "sound";
            format = " $icon {$volume.eng(w:1) |}";
            max_vol = 100;
            step_width = 2;
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %b %-d %-H:%M') ";
            interval = 1;
          }
        ];

        theme = "native";
      };
    };
  };
}
