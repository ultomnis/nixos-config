{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.fd;

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
