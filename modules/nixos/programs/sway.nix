{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.system.programs.sway;

in
{
  config = lib.mkIf cfg.enable {
    # Tiling Wayland compositor
    programs.sway = {
      enable = true;
      package = pkgs.swayfx;
      wrapperFeatures.gtk = true;
      extraPackages = [ ];
    };
  };
}
