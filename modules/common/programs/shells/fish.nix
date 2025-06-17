{ config, ... }:

let
  cfg = config.luminosity.system.programs.fish;

in
{
  # The friendly interactive shell
  programs.fish = {
    inherit (cfg) enable;
  };
}
