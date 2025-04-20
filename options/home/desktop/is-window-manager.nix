{ lib, osConfig, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkIsWindowManagerOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;

        default = (
          builtins.elem osConfig.luminosity.system.selections.desktop [
            "aerospace"
            "sway"
          ]
        );

        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in

{
  options.luminosity.desktop = {
    gnome-keyring = mkIsWindowManagerOption "GNOME Keyring" { };
    mako = mkIsWindowManagerOption "mako" { };
    polkit-gnome = mkIsWindowManagerOption "Polkit GNOME" { };
    waybar = mkIsWindowManagerOption "Waybar" { };
  };
}
