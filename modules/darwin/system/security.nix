{
  security = {
    # sudo authentication with Touch ID
    pam.enableSudoTouchIdAuth = true;

    sudo.extraConfig = ''
      Defaults passprompt="What? Make it yourself:"
    '';
  };
}
