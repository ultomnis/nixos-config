{
  # Enable support for Bluetooth
  hardware.bluetooth = {
    enable = true;

    settings = {
      General = {
        FastConnectable = true;
      };
    };
  };

  # Bluetooth manager
  services.blueman.enable = true;
}
