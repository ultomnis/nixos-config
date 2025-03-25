{ userConfig, ... }:

{
  # Distributed version control system
  programs.git = {
    enable = true;

    userName = "${userConfig.gitName}";
    userEmail = "${userConfig.githubEmail}";

    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
    };
  };
}
