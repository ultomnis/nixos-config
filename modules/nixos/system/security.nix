{
  security = {
    # Pluggable Authentication Modules
    pam = {
      services = {
        ly.enableGnomeKeyring = true;
      };
    };
    
    sudo.extraConfig = ''
      Defaults passprompt="What? Make it yourself:"
    '';
  };
}
