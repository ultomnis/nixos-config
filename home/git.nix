{
  programs.git = {
    enable = true;

    userName = "ultomnis";
    userEmail = "125839032+ultomnis@users.noreply.github.com";

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
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
