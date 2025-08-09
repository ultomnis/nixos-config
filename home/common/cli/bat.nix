{ config, ... }:

let
  cfg = config.luminosity.home.programs.cli.bat;

in
{
  # Alternative to cat
  programs.bat = {
    inherit (cfg) enable;

    config = {
      squeeze-blank = true;
      squeeze-limit = "1";
    };
  };
}
