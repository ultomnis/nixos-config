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
      default = config.luminosity.system.programs.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.system.programs = {
    adb.enable = mkProgramOption "Android Debug Bridge";
    fish.enable = mkProgramOption "fish";
    homebrew.enable = mkProgramOption "Homebrew";
    steam.enable = mkProgramOption "Steam";

    sway = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.selections.desktop == "sway";
        description = "Whether to enable Sway.";
      };
    };

    zsh.enable = mkProgramOption "Zsh";
  };
}
