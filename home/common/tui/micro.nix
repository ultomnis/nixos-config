{ config, ... }:

let
  cfg = config.luminosity.home.tui.micro;

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

  stylix.targets.micro = {
    inherit (cfg) enable;
  };
}
