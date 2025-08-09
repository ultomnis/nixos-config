{ config, ... }:

let
  cfg = config.luminosity.modules.programs.sway;

in
{
  # Tiling Wayland compositor
  programs.sway = {
    inherit (cfg) enable;
    extraPackages = [ ];
  };
}
