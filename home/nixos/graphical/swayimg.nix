{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.graphical.swayimg;

in
{
  config = lib.mkIf cfg.enable {
    # Image viewer
    programs.swayimg = {
      enable = true;

      settings = {
        info = {
          show = "no";
        };
      };
    };
  };
}
