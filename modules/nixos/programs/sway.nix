{ config, lib, ... }:

let
  cfg = config.luminosity.modules.programs.sway;

in
{
  config = lib.mkIf cfg.enable {
    # Tiling Wayland compositor
    programs.sway = {
      inherit (cfg) enable;
      extraPackages = [ ];
    };

    xdg.portal.extraPortals = lib.mkForce [ ];
  };
}
