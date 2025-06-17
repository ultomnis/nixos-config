{ config, ... }:

let
  cfg = config.luminosity.system.programs.adb;

in
{
  # Android Debug Bridge
  programs.adb = {
    inherit (cfg) enable;
  };
}
