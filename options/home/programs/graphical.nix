{ config, lib, ... }:

let
  inherit (lib)
    mkEnableOption
    mkOption
    types
    ;

  mkGraphicalOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.programs.graphical.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.home.programs.graphical = {
    bitwarden = mkGraphicalOption "Bitwarden" {
      sshAgent.enable = mkEnableOption "Whether to enable the Bitwarden SSH Agent.";
    };

    firefox = mkGraphicalOption "Firefox" { };

    foot = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.terminal == "foot";
        description = "Whether to enable foot.";
      };

      theme = mkOption {
        type = types.str;
        default = config.luminosity.home.desktop.environment.themes.name;
        description = "Theme for foot.";
      };
    };

    imv = mkGraphicalOption "imv" { };
    mangohud = mkGraphicalOption "MangoHud" { };
    mpv = mkGraphicalOption "MPV" { };
    mullvad-browser = mkGraphicalOption "Mullvad Browser" { };
    nexusmods-app = mkGraphicalOption "Nexus Mods App" { };
    piper = mkGraphicalOption "Piper" { };
    pwvucontrol = mkGraphicalOption "pwvucontrol" { };
    thunderbird = mkGraphicalOption "Thunderbird" { };
    tor-browser = mkGraphicalOption "Tor Browser" { };
    utm = mkGraphicalOption "UTM" { };

    wezterm = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.terminal == "wezterm";
        description = "Whether to enable WezTerm.";
      };

      theme = mkOption {
        type = types.str;
        default = config.luminosity.home.desktop.environment.themes.name;
        description = "Theme for WezTerm.";
      };
    };
  };
}
