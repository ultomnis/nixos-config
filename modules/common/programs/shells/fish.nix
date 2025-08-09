{ config, ... }:

let
  cfg = config.luminosity.modules.programs.fish;

in
{
  # The friendly interactive shell
  programs.fish = {
    inherit (cfg) enable;
  };
}
