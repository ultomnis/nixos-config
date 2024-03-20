{
  # Local print service
  services.printing = {
    enable = true;
    
    cups-pdf = {
      enable = true;
    };
  };

  # Autodiscovery of network printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
