{ lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

in
{
  options.luminosity.desktop.environment = {
    launcherCommand = mkOption {
      type = types.str;
      default = null;
      description = "Launcher command to use when opened from a status bar.";
    };

    swayOutput = mkOption {
      type = types.attrsOf (types.attrsOf types.str);
      default = { };
      description = "Define Sway outputs.";
    };
  };
}
