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
    |> lib.recursiveUpdate extraOptions;

in
{
  options.luminosity.home.programs.terminal = {
    bash = mkTerminalOption "bash" { };
    bat = mkTerminalOption "bat" { };
    btop = mkTerminalOption "btop" { };
    eza = mkTerminalOption "eza" { };
    fd = mkTerminalOption "fd" { };
    ffmpeg = mkTerminalOption "ffmpeg" { };
    fish = mkTerminalOption "fish" { };
    fzf = mkTerminalOption "fzf" { };

    git = mkTerminalOption "Git" {
      userEmail = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = "Default email for Git.";
      };

      userName = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = "Default username for Git.";
      };

      githubEmail = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.programs.terminal.git.userEmail;
        description = "Git email for the ~/GitHub directory.";
      };

      githubName = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.programs.terminal.git.userName;
        description = "Git username for the ~/GitHub directory.";
      };
    };

    helix = mkTerminalOption "Helix" {
      theme = mkOption {
        type = types.nullOr types.str;
        default = "rose_pine";
        description = "Theme for Helix.";
      };
    };

    kew = mkTerminalOption "kew" { };
    libqalculate = mkTerminalOption "libqalculate" { };
    mat2 = mkTerminalOption "mat2" { };
    micro = mkTerminalOption "micro" { };

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
    zsh = mkTerminalOption "zsh" { };
  };
}
