{ config, ... }:

let
  cfg = config.luminosity.modules.system.programs.adb;

in
{
  # Android Debug Bridge
  programs.adb = {
    inherit (cfg) enable;
  };
}
