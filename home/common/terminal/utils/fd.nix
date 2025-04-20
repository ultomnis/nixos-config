{ config, lib, ... }:

let
  cfg = config.luminosity.programs.terminal.fd;

in
{
  config = lib.mkIf cfg.enable {
    # Alternative to find
    programs.fd = {
      enable = true;

      ignores = [
        ".git/"
      ];
    };
  };
}
