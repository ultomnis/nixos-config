{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.git;

in
{
  # Distributed version control system
  programs.git =
    {
      inherit (cfg) enable;

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

            user =
              {
                signingKey = "${config.home.homeDirectory}/.ssh/github.pub";
              }
              |> lib.recursiveUpdate (
                lib.optionalAttrs (cfg.githubEmail != null) {
                  email = cfg.githubEmail;
                }
              )
              |> lib.recursiveUpdate (
                lib.optionalAttrs (cfg.githubName != null) {
                  name = cfg.githubName;
                }
              );
          };
        }
      ];
    }
    |> lib.recursiveUpdate (
      lib.optionalAttrs (cfg.userEmail != null) {
        userEmail = cfg.userEmail;
      }
    )
    |> lib.recursiveUpdate (
      lib.optionalAttrs (cfg.userName != null) {
        userName = cfg.userName;
      }
    );
}
