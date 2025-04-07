{
  security = {
    # Pluggable Authentication Modules
    pam = {
      # Realtime priority
      loginLimits = [
        {
          domain = "@users";
          item = "rtprio";
          type = "-";
          value = 1;
        }
      ];

      services = {
        greetd.enableGnomeKeyring = true;
      };
    };

    # RealtimeKit system service
    rtkit.enable = true;
  };
}
