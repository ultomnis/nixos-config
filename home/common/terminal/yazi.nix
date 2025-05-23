{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.yazi;

in
{
  config = lib.mkIf cfg.enable {
    # Terminal file manager
    programs.yazi = {
      enable = true;

      settings = {
        manager = {
          show_hidden = true;
          sort_by = "natural";
        };
      };
    };
  };
}
