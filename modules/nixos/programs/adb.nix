{ config, ... }:

let
  cfg = config.luminosity.modules.programs.adb;

in
{
  # Android Debug Bridge
  programs.adb = {
    inherit (cfg) enable;
  };
}
