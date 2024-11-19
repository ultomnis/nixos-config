{
  security = {
    # Pluggable Authentication Modules
    pam = {
      services.hyprlock = {};
    };

    sudo.extraConfig = ''
      Defaults passprompt="What? Make it yourself:"
    '';
  };
}
