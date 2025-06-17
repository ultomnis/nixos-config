{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.bat;

in
{
  # Alternative to cat
  programs.bat = {
    inherit (cfg) enable;

    config = {
      theme = "base16";
      squeeze-blank = true;
      squeeze-limit = "1";
    };
  };
}
