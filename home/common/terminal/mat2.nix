{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.programs.terminal.mat2;

in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      mat2
    ];
  };
}
