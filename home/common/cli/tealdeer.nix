{ config, ... }:

let
  cfg = config.luminosity.home.cli.tealdeer;

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
