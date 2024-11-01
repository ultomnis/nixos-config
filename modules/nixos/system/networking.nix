{
  # iNet wireless daemon
  networking.wireless.iwd = {
    enable = true;

    settings = {
      General = {
        AddressRandomization = "network";
      };
    };
  };
}
