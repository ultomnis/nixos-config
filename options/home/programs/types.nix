{ lib, ... }:

let
  inherit (lib) mkEnableOption;

in
{
  options.luminosity.programs = {
    graphical.enable = mkEnableOption "Whether to enable graphical programs.";
    terminal.enable = mkEnableOption "Whether to enable terminal programs.";
  };
}
