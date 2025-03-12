{
  security = {
    # Sudo authentication with Touch ID
    pam.services.sudo_local.touchIdAuth = true;

    sudo.extraConfig = ''
      Defaults passprompt="What? Make it yourself:"
    '';
  };
}
