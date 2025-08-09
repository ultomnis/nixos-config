{ config, ... }:

let
  cfg = config.luminosity.modules.system.programs.sway;

in
{
  # Tiling Wayland compositor
  programs.sway = {
    inherit (cfg) enable;
    extraPackages = [ ];
  };
}
