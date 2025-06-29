{ lib, ... }:

let
  inherit (lib) mkEnableOption;

in
{
  options.luminosity = {
    system = {
      configurations.enable = mkEnableOption "system configurations";
      programs.enable = mkEnableOption "system-level programs";
      services.enable = mkEnableOption "system-level services";
    };
  };
}
