{ config, lib, ... }:

let
  inherit (config.luminosity.selections) desktop;

in
{
  config = lib.mkIf (desktop == "sway") {
    # Tiling Wayland compositor
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = [ ];
    };
  };
}
