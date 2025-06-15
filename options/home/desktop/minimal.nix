{
  config,
  lib,
  osConfig ? null,
  ...
}:

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
    |> lib.recursiveUpdate extraOptions;

  nixConfig = if (osConfig != null) then osConfig else config;

in
{
  options.luminosity.home.desktop.minimal = {
    aerospace = {
      enable = mkOption {
        type = types.bool;
        default = nixConfig.luminosity.selections.desktop == "aerospace";
        description = "Whether to enable AeroSpace.";
      };
    };

    fuzzel = mkMinimalOption "fuzzel" { };
    gammastep = mkMinimalOption "Gammastep" { };
    gnome-keyring = mkMinimalOption "GNOME Keyring" { };
    mako = mkMinimalOption "mako" { };
    polkit-gnome = mkMinimalOption "Polkit GNOME" { };
    ssh-agent = mkMinimalOption "SSH Agent" { };

    sway = {
      enable = mkOption {
        type = types.bool;
        default = nixConfig.luminosity.selections.desktop == "sway";
        description = "Whether to enable Sway.";
      };
    };

    waybar = mkMinimalOption "Waybar" {
      menuCommand = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = "Command to use when clicking menu";
      };
    };
  };
}
