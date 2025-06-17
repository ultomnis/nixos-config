{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.yazi;

in
{
  # Terminal file manager
  programs.yazi = {
    inherit (cfg) enable;

    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "natural";
      };
    };
  };
}
