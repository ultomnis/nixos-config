{
  services = {
    # Local print service
    printing = {
      enable = true;
      stateless = true;
    };

    # Enable autodiscovery of network printers
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
  };
}
