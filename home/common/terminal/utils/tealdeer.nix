{ config, lib, ... }:

let
  cfg = config.luminosity.programs.terminal.tealdeer;

in
{
  config = lib.mkIf cfg.enable {
    # Fast implementation of tldr
    programs.tealdeer = {
      enable = true;

      settings = {
        updates = {
          auto_update = true;
        };
      };
    };
  };
}
