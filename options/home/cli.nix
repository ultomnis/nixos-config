{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkCliOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.home.cli.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.home.cli = {
    _7zz.enable = mkCliOption "7-Zip";
    bat.enable = mkCliOption "bat";
    eza.enable = mkCliOption "eza";
    fd.enable = mkCliOption "fd";
    ffmpeg.enable = mkCliOption "ffmpeg";
    fish.enable = mkCliOption "fish";
    fzf.enable = mkCliOption "fzf";

    git = {
      enable = mkCliOption "Git";

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
        default = config.luminosity.home.cli.git.userEmail;
        description = "Git email for the ~/GitHub directory.";
      };

      githubName = mkOption {
        type = types.nullOr types.str;
        default = config.luminosity.home.cli.git.userName;
        description = "Git username for the ~/GitHub directory.";
      };
    };

    libqalculate.enable = mkCliOption "libqalculate";
    mat2.enable = mkCliOption "mat2";
    mcat.enable = mkCliOption "mcat";
    mpv.enable = mkCliOption "MPV";

    ollama = {
      enable = mkCliOption "Ollama";

      environmentVariables = mkOption {
        type = types.attrsOf types.str;
        default = { };
        description = "Set environment variables for Ollama.";
      };
    };

    poppler-utils.enable = mkCliOption "poppler-utils";
    ripgrep.enable = mkCliOption "ripgrep";
    ssh.enable = mkCliOption "SSH";
    syncthing.enable = mkCliOption "Syncthing";
    tealdeer.enable = mkCliOption "tealdeer";
    yt-dlp.enable = mkCliOption "yt-dlp";
    zoxide.enable = mkCliOption "zoxide";
    zsh.enable = mkCliOption "zsh";
  };
}
