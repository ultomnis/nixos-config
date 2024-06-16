{ userConfig, ... }:

{
  programs.git = {
    enable = true;

    userName = "${userConfig.gitName}";
    userEmail = "${userConfig.gitEmail}";

    # Define git aliases
    aliases = {
      br = "branch";
      ci = "commit";
      co = "checkout";
      st = "status";
    };

    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "/home/${userConfig.username}/.ssh/id_ed25519.pub";
    };
  };
}
