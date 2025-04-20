{ config, lib, ... }:

let
  cfg = config.luminosity.programs.terminal.bat;

in
{
  config = lib.mkIf cfg.enable {
    # Alternative to cat
    programs.bat = {
      enable = true;

      config = {
        theme = "base16";
        squeeze-blank = true;
        squeeze-limit = "1";
      };
    };
  };
}
