{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.cli.grim;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.grim
    ];
  };
}
