{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkProgramOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.system.programs.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.system.programs = {
    adb = mkProgramOption "Android Debug Bridge" { };
    homebrew = mkProgramOption "Homebrew" { };
    obs-studio = mkProgramOption "OBS Studio" { };
    steam = mkProgramOption "Steam" { };
    virt-manager = mkProgramOption "Virtual Machine Manager" { };
  };
}
