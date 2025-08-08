{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.i3status-rust;

in
{
  # i3status replacement written in Rust
  programs.i3status-rust = {
    inherit (cfg) enable;

    bars = {
      status = {
        blocks =
          lib.optional cfg.battery {
            block = "battery";
            missing_format = "";
          }
          ++ [
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

        settings = {
          theme = {
            theme = "native";

            overrides = {
              critical_fg = "#ff0000";
              good_fg = "#00ff00";
              idle_fg = "#ffffff";
              info_fg = "#ffffff";
              warning_fg = "#ffff00";
            };
          };
        };
      };
    };
  };
}
