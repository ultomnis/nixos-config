{ config, ... }:

let
  cfg = config.luminosity.home.gui.keepassxc;

in
{
  programs.keepassxc = {
    inherit (cfg) enable;
  };
}
