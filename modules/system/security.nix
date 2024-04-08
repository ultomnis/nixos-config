{
  security = {
    pam = {
      services = {
        # Unlock GNOME Keyring upon login
        greetd.enableGnomeKeyring = true;
    
        # Hyprlock PAM authentication
        hyprlock = {};
      };

      # Realtime priority
      loginLimits = [
        { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
      ];
    };

    # Realtime policy and watchdog daemon
    rtkit.enable = true;
  };
}
