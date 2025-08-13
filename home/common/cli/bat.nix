{ config, ... }:

let
  cfg = config.luminosity.home.cli.bat;

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

  stylix.targets.bat = {
    inherit (cfg) enable;
  };
}
