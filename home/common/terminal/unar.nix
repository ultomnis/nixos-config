{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.unar;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      unar
    ];
  };
}
