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
    |> lib.recursiveUpdate extraOptions;

in
{
  options.luminosity.system.programs = {
    adb = mkProgramOption "Android Debug Bridge" { };
    fish = mkProgramOption "fish" { };
    homebrew = mkProgramOption "Homebrew" { };
    steam = mkProgramOption "Steam" { };

    sway = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.selections.desktop == "sway";
        description = "Whether to enable Sway.";
      };
    };

    zsh = mkProgramOption "Zsh" { };
  };
}
