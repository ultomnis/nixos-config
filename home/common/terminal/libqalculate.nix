{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.programs.terminal.libqalculate;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      libqalculate
    ];
  };
}
