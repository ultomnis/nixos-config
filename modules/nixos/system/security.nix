{
  security = {
    # Pluggable Authentication Modules
    pam = {
      services = {
        greetd.enableGnomeKeyring = true;
        swaylock = {};
      };
    };

    sudo.extraConfig = ''
      Defaults passprompt="What? Make it yourself:"
    '';
  };
}
