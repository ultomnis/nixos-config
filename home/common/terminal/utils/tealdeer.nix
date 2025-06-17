{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.tealdeer;

in
{
  # Fast implementation of tldr
  programs.tealdeer = {
    inherit (cfg) enable;

    settings = {
      updates = {
        auto_update = true;
      };
    };
  };
}
