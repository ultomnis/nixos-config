{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkProgramOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.modules.system.programs.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.modules.system.programs = {
    adb.enable = mkProgramOption "Android Debug Bridge";
    fish.enable = mkProgramOption "fish";
    steam.enable = mkProgramOption "Steam";

    sway = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.modules.selections.desktop == "sway";
        description = "Whether to enable Sway.";
      };
    };

    zsh.enable = mkProgramOption "Zsh";
  };
}
