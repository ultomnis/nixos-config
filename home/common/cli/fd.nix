{ config, ... }:

let
  cfg = config.luminosity.home.programs.cli.fd;

in
{
  # Alternative to find
  programs.fd = {
    inherit (cfg) enable;

    ignores = [
      ".git/"
    ];
  };
}
