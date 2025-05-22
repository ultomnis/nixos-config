{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.git;

in
{
  config = lib.mkIf cfg.enable {
    # Distributed version control system
    programs.git = {
      enable = true;
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
              email = lib.mkIf (cfg.email != null) cfg.email;
              signingKey = "${config.home.homeDirectory}/.ssh/github.pub";
            };
          };
        }
      ];
    };
  };
}
