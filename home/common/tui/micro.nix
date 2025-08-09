{ config, ... }:

let
  cfg = config.luminosity.home.programs.tui.micro;

in
{
  # Text editor
  programs.micro = {
    inherit (cfg) enable;

    settings = {
      diffgutter = true;
      relativeruler = true;
    };
  };
}
