{ config, lib, ... }:

let
  cfg = config.luminosity.system.programs.sway;

in
{
  config = lib.mkIf cfg.enable {
    # Tiling Wayland compositor
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = [ ];
    };
  };
}
