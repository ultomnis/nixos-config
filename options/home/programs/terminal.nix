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
        default = config.luminosity.programs.terminal.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.programs.terminal = {
    bat = mkTerminalOption "bat" { };
    btop = mkTerminalOption "btop" { };
    eza = mkTerminalOption "eza" { };
    fd = mkTerminalOption "fd" { };
    ffmpeg = mkTerminalOption "ffmpeg" { };
    fish = mkTerminalOption "fish" { };
    fzf = mkTerminalOption "fzf" { };

    git = mkTerminalOption "Git" {
      userName = mkOption {
        type = types.str;
        default = "";
        description = "Default username for Git.";
      };

      email = mkOption {
        type = types.str;
        default = "";
        description = "Default email for Git.";
      };
    };

    helix = mkTerminalOption "Helix" { };
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
    tealdeer = mkTerminalOption "tealdeer" { };
    unar = mkTerminalOption "unar" { };
    yazi = mkTerminalOption "Yazi" { };
    yt-dlp = mkTerminalOption "yt-dlp" { };
    zoxide = mkTerminalOption "zoxide" { };
  };
}
