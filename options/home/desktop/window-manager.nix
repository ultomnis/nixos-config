{
  lib,
  osConfig ? null,
  ...
}:

let
  inherit (lib)
    mkOption
    types
    ;

  mkWindowManagerOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;

        default =
          if (osConfig != null) then
            (builtins.elem osConfig.luminosity.selections.desktop [
              "aerospace"
              "sway"
            ])
          else
            false;

        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in

{
  options.luminosity.desktop = {
    gnome-keyring = mkWindowManagerOption "GNOME Keyring" { };
    mako = mkWindowManagerOption "mako" { };
    polkit-gnome = mkWindowManagerOption "Polkit GNOME" { };
    waybar = mkWindowManagerOption "Waybar" { };
  };
}
