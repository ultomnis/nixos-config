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

    git = mkTerminalOption "git" {
      userName = mkOption {
        type = types.str;
        default = "";
        description = "Default username for git.";
      };

      email = mkOption {
        type = types.str;
        default = "";
        description = "Default email for git.";
      };
    };

    helix = mkTerminalOption "helix" { };
    libqalculate = mkTerminalOption "libqalculate" { };
    mat2 = mkTerminalOption "mat2" { };

    ollama = mkTerminalOption "ollama" {
      environmentVariables = mkOption {
        type = types.attrsOf types.str;
        default = { };
        description = "Set environment variables for ollama.";
      };
    };

    ripgrep = mkTerminalOption "ripgrep" { };
    ssh = mkTerminalOption "ssh" { };
    tealdeer = mkTerminalOption "tealdeer" { };
    unar = mkTerminalOption "unar" { };
    yazi = mkTerminalOption "yazi" { };
    yt-dlp = mkTerminalOption "yt-dlp" { };
    zoxide = mkTerminalOption "zoxide" { };
  };
}
