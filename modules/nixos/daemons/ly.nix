{
  services.displayManager.ly = {
    enable = true;

    settings = {
      clear_password = true;
      clock = "%a %b %d %H:%M";
    };
  };

  # Fix graphical-session.target
  services.displayManager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
}
