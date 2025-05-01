{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkMinimalOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.desktop.minimal.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in

{
  options.luminosity.home.desktop.minimal = {
    gnome-keyring = mkMinimalOption "GNOME Keyring" { };
    mako = mkMinimalOption "mako" { };
    polkit-gnome = mkMinimalOption "Polkit GNOME" { };

    waybar = mkMinimalOption "Waybar" {
      menuCommand = mkOption {
        type = types.str;
        default = null;
        description = "Command to use when clicking menu";
      };
    };

    wlsunset = mkMinimalOption "wlsunset" { };
  };
}
