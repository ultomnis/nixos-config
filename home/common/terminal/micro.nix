{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.micro;

in
{
  # Text editor
  programs.micro = {
    inherit (cfg) enable;

    settings = {
      colorscheme = "cmc-16";
      diffgutter = true;
      relativeruler = true;
    };
  };
}
