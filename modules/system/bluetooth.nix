{
  # Enable support for Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  services.blueman.enable = true;
}
