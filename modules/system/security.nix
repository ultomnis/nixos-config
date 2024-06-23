{
  security = {
    pam = {
      services = {
        # Hyprlock PAM authentication
        hyprlock = {};
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
