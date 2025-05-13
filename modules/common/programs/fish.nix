{ config, lib, ... }:

let
  cfg = config.luminosity.system.programs.fish;

in
{
  config = lib.mkIf cfg.enable {
    # The friendly interactive shell
    programs.fish.enable = true;
  };
}
