{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.cli.slurp;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.slurp
    ];
  };
}
