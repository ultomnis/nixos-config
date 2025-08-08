{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkTerminalOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.home.programs.terminal.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.home.programs.terminal = {
    _7zz.enable = mkTerminalOption "7-Zip";
    bash.enable = mkTerminalOption "bash";
    bat.enable = mkTerminalOption "bat";
    btop.enable = mkTerminalOption "btop";
    eza.enable = mkTerminalOption "eza";
    fd.enable = mkTerminalOption "fd";
    ffmpeg.enable = mkTerminalOption "ffmpeg";
    fish.enable = mkTerminalOption "fish";
    fzf.enable = mkTerminalOption "fzf";

    git = {
      enable = mkTerminalOption "Git";

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

    helix.enable = mkTerminalOption "Helix";
    kew.enable = mkTerminalOption "kew";
    libqalculate.enable = mkTerminalOption "libqalculate";
    mat2.enable = mkTerminalOption "mat2";
    mcat.enable = mkTerminalOption "mcat";
    micro.enable = mkTerminalOption "micro";

    ollama = {
      enable = mkTerminalOption "Ollama";

      environmentVariables = mkOption {
        type = types.attrsOf types.str;
        default = { };
        description = "Set environment variables for Ollama.";
      };
    };

    poppler-utils.enable = mkTerminalOption "poppler-utils";
    ripgrep.enable = mkTerminalOption "ripgrep";
    ssh.enable = mkTerminalOption "SSH";
    syncthing.enable = mkTerminalOption "Syncthing";
    tealdeer.enable = mkTerminalOption "tealdeer";
    yazi.enable = mkTerminalOption "Yazi";
    yt-dlp.enable = mkTerminalOption "yt-dlp";
    zoxide.enable = mkTerminalOption "zoxide";
    zsh.enable = mkTerminalOption "zsh";
  };
}
