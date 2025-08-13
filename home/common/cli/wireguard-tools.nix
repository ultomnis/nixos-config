{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.cli.wireguard-tools;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.wireguard-tools
    ];
  };
}
