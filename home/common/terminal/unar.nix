{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.programs.terminal.unar;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      unar
    ];
  };
}
