{ lib, ... }:

let
  inherit (lib) mkEnableOption;

in
{
  options.luminosity = {
    system = {
      configurations.enable = mkEnableOption "Whether to enable system configurations.";
      programs.enable = mkEnableOption "Whether to enable system-level programs.";
      services.enable = mkEnableOption "Whether to enable system-level services.";
    };
  };
}
