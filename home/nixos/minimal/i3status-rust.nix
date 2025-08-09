{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.minimal.i3status-rust;

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

              click = [
                {
                  button = "left";
                  cmd =
                    "${lib.getExe pkgs.iwmenu} -l custom"
                    + " --launcher-command \"${lib.getExe pkgs.fuzzel} --anchor top-right\"";
                }
                {
                  button = "right";
                  cmd =
                    "${lib.getExe pkgs.bzmenu} -l custom"
                    + " --launcher-command \"${lib.getExe pkgs.fuzzel} --anchor top-right\"";
                }
              ];
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
      };
    };
  };
}
