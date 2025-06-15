{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.git;

in
{
  config = lib.mkIf cfg.enable {
    # Distributed version control system
    programs.git = {
      enable = true;
      userEmail = lib.mkIf (cfg.userEmail != null) cfg.userEmail;
      userName = lib.mkIf (cfg.userName != null) cfg.userName;

      # Syntax-highlighting pager
      delta = {
        enable = true;

        options = {
          navigate = true;
          syntax-theme = "base16";
        };
      };

      extraConfig = {
        diff.algorithm = "histogram";
        init.defaultBranch = "main";
        merge.conflictStyle = "zdiff3";
        user.useConfigOnly = true;
      };

      includes = [
        {
          condition = "gitdir:${config.home.homeDirectory}/GitHub/";

          contents = {
            commit.gpgSign = true;
            gpg.format = "ssh";

            user = {
              email = lib.mkIf (cfg.githubEmail != null) cfg.githubEmail;
              name = lib.mkIf (cfg.githubName != null) cfg.githubName;
              signingKey = "${config.home.homeDirectory}/.ssh/github.pub";
            };
          };
        }
      ];
    };
  };
}
