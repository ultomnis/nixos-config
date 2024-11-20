{
  security = {
    # Pluggable Authentication Modules
    pam = {
      services.swaylock = {};
    };

    sudo.extraConfig = ''
      Defaults passprompt="What? Make it yourself:"
    '';
  };
}
