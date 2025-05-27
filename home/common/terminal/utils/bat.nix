{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.bat;

in
{
  config = lib.mkIf cfg.enable {
    # Alternative to cat
    programs.bat = {
      enable = true;

      config = {
        squeeze-blank = true;
        squeeze-limit = "1";
      };
    };
  };
}
