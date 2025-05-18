{
  config,
  lib,
  osConfig ? null,
  ...
}:

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
        default =
          if (osConfig != null) then
            (osConfig.luminosity.selections.terminal == "foot")
          else
            (config.luminosity.selections.terminal == "foot");
        description = "Whether to enable foot.";
      };

      font = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.desktop.environment.fonts.mono;
        description = "Font for foot.";
      };

      fontSize = mkOption {
        type = types.nullOr types.int;
        default = config.luminosity.home.desktop.environment.fonts.size;
        description = "Font size for foot.";
      };

      theme = mkOption {
        type = types.nullOr types.str;
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
        default =
          if (osConfig != null) then
            (osConfig.luminosity.selections.terminal == "wezterm")
          else
            (config.luminosity.selections.terminal == "wezterm");
        description = "Whether to enable WezTerm.";
      };

      font = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.desktop.environment.fonts.mono;
        description = "Font for WezTerm.";
      };

      fontSize = mkOption {
        type = types.nullOr types.int;
        default = config.luminosity.home.desktop.environment.fonts.size;
        description = "Font size for WezTerm.";
      };

      maxFPS = mkOption {
        type = types.int;
        default = 60;
        description = "Maximum FPS for WezTerm.";
      };

      theme = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.desktop.environment.themes.name;
        description = "Theme for WezTerm.";
      };
    };

    zed-editor = mkGraphicalOption "Zed" {
      font = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.desktop.environment.fonts.mono;
        description = "Font for Zed.";
      };

      fontSize = mkOption {
        type = types.nullOr types.int;
        default = config.luminosity.home.desktop.environment.fonts.size;
        description = "Font size for Zed.";
      };

      theme = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.desktop.environment.themes.name;
        description = "Theme for Zed.";
      };
    };
  };
}
