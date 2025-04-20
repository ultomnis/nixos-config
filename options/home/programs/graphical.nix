{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkGraphicalOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.programs.graphical.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.programs.graphical = {
    bitwarden = mkGraphicalOption "Bitwarden" { };
    firefox = mkGraphicalOption "Firefox" { };
    imv = mkGraphicalOption "imv" { };
    mangohud = mkGraphicalOption "MangoHud" { };
    mpv = mkGraphicalOption "MPV" { };
    mullvad-browser = mkGraphicalOption "Mullvad Browser" { };
    piper = mkGraphicalOption "Piper" { };
    pwvucontrol = mkGraphicalOption "pwvucontrol" { };
    thunderbird = mkGraphicalOption "Thunderbird" { };
    utm = mkGraphicalOption "UTM" { };
    wlsunset = mkGraphicalOption "wlsunset" { };
  };
}
