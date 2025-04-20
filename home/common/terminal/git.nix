{ config, lib, ... }:

let
  inherit (config.luminosity.programs.terminal) git;

in
{
  config = lib.mkIf git.enable {
    # Distributed version control system
    programs.git = {
      enable = true;
      userName = git.userName;

      # Syntax-highlighting pager
      delta = {
        enable = true;

        options = {
          navigate = true;
          syntax-theme = "base16";
        };
      };

      extraConfig = {
        merge = {
          conflictStyle = "zdiff3";
        };

        user = {
          useConfigOnly = true;
        };
      };

      includes = [
        {
          condition = "gitdir:${config.home.homeDirectory}/GitHub/";

          contents = {
            commit.gpgSign = true;
            gpg.format = "ssh";

            user = {
              email = git.email;
              signingKey = "${config.home.homeDirectory}/.ssh/github.pub";
            };
          };
        }
      ];
    };
  };
}
