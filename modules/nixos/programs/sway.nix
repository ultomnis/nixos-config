{ config, pkgs, ... }:

let
  cfg = config.luminosity.system.programs.sway;

in
{
  # Tiling Wayland compositor
  programs.sway = {
    inherit (cfg) enable;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    extraPackages = [ ];
  };
}
