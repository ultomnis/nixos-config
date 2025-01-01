{
  # Secure Shell
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    extraConfig = ''
      Host *
        IgnoreUnknown UseKeychain
        UseKeychain yes

      Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/github
        IdentitiesOnly yes
    '';
  };
}
