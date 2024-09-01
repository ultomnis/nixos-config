{
  security = {
    pam = {
      services = {
        # Automatically unlock keyring
        greetd.enableGnomeKeyring = true;
        
        # Swaylock PAM authentication
        swaylock = {};
      };

      # Realtime priority
      loginLimits = [
        {
          domain = "@users";
          item = "rtprio";
          type = "-";
          value = 1;
        }
      ];
    };

    # Realtime policy and watchdog daemon
    rtkit.enable = true;
  };
}
