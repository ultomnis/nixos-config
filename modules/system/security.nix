{
  security = {
    pam.services = {
      # Unlock GNOME Keyring upon login
      greetd.enableGnomeKeyring = true;
    
      # Hyprlock PAM authentication
      hyprlock = { };
    };

    # Realtime policy and watchdog daemon
    rtkit.enable = true;
  };
}
