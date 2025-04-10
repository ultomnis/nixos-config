{ config, vars, ... }:

{
  # Distributed version control system
  programs.git = {
    enable = true;
    userName = "${vars.userConfig.gitName}";

    # Syntax-highlighting pager
    delta = {
      enable = true;

      options = {
        syntax-theme = "base16";
      };
    };

    extraConfig = {
      user.useConfigOnly = true;
    };

    includes = [
      {
        condition = "gitdir:${config.home.homeDirectory}/GitHub/";

        contents = {
          commit.gpgSign = true;
          gpg.format = "ssh";

          user = {
            email = "${vars.userConfig.githubEmail}";
            signingKey = "${config.home.homeDirectory}/.ssh/github.pub";
          };
        };
      }
    ];
  };
}
