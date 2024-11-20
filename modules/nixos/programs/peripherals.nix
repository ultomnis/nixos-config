{ pkgs, ... }:

{
  # Device manager
  services.udev = {
    packages = with pkgs; [
      logitech-udev-rules
    ];
  };

  # i2c devices
  hardware.i2c.enable = true;
}
