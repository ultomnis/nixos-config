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

    fish = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.selections.shell == "fish";
        description = "Whether to enable fish shell.";
      };
    };

    homebrew = mkProgramOption "Homebrew" { };
    steam = mkProgramOption "Steam" { };

    sway = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.selections.desktop == "sway";
      };
    };

    virt-manager = mkProgramOption "Virtual Machine Manager" { };

    zsh = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.selections.shell == "zsh";
        description = "Whether to enable Zsh.";
      };
    };
  };
}
