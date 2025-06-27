{
  config,
  lib,
  pkgs,
  ...
}:

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

              click =
                lib.optional (cfg.terminal == "foot") {
                  button = "left";
                  cmd = "${lib.getExe pkgs.foot} --app-id=wiremix ${lib.getExe pkgs.wiremix}";
                }
                ++ lib.optional (cfg.terminal == "wezterm") {
                  button = "left";
                  cmd = "${lib.getExe pkgs.wezterm} start --class wiremix ${lib.getExe pkgs.wiremix}";
                };
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
