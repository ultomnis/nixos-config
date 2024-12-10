{
  # Wayland screen locker
  programs.swaylock = {
    enable = true;

    settings = {
      show-failed-attempts = true;
    };
  };
}
