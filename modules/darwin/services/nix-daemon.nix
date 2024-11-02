{
  # Auto upgrade nix package and the daemon service
  services.nix-daemon = {
    enable = true;
    logFile = "/var/log/nix-daemon.log";
  };
}
