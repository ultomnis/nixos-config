{
  security = {
    # Swaylock PAM authentication
    pam.services.swaylock = { };

    # Realtime policy and watchdog daemon
    rtkit.enable = true;
  };
}
