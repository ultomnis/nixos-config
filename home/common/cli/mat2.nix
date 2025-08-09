{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.cli.mat2;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.mat2
    ];
  };
}
