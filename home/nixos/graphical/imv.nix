{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.graphical.imv;

in
{
  config = lib.mkIf cfg.enable {
    # Image viewer
    programs.imv = {
      enable = true;

      settings = {
        options = {
          overlay_position_bottom = true;
        };
      };
    };
  };
}
