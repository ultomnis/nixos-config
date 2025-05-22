{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkTerminalOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.programs.terminal.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.home.programs.terminal = {
    bash = mkTerminalOption "bash" { };

    bat = mkTerminalOption "bat" {
      theme = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.desktop.environment.themes.name;
        description = "Theme for bat.";
      };
    };

    btop = mkTerminalOption "btop" {
      theme = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.desktop.environment.themes.name;
        description = "Theme for btop.";
      };
    };

    eza = mkTerminalOption "eza" { };
    fd = mkTerminalOption "fd" { };
    ffmpeg = mkTerminalOption "ffmpeg" { };
    fish = mkTerminalOption "fish" { };
    fzf = mkTerminalOption "fzf" { };

    git = mkTerminalOption "Git" {
      email = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = "Default email for Git.";
      };

      syntaxTheme = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.desktop.environment.themes.name;
        description = "Syntax theme for delta.";
      };

      userName = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = "Default username for Git.";
      };
    };

    helix = mkTerminalOption "Helix" {
      theme = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.desktop.environment.themes.name;
        description = "Theme for Helix.";
      };
    };

    libqalculate = mkTerminalOption "libqalculate" { };
    mat2 = mkTerminalOption "mat2" { };

    ollama = mkTerminalOption "Ollama" {
      environmentVariables = mkOption {
        type = types.attrsOf types.str;
        default = { };
        description = "Set environment variables for Ollama.";
      };
    };

    ripgrep = mkTerminalOption "ripgrep" { };
    ssh = mkTerminalOption "SSH" { };
    superfile = mkTerminalOption "superfile" { };
    tealdeer = mkTerminalOption "tealdeer" { };
    unar = mkTerminalOption "unar" { };
    yt-dlp = mkTerminalOption "yt-dlp" { };
    zoxide = mkTerminalOption "zoxide" { };
    zsh = mkTerminalOption "zsh" { };
  };
}
