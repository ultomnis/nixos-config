{ pkgs, ... }:

{
  # Device manager
  services.udev = {
    packages = with pkgs; [
      logitech-udev-rules
    ];
  };
}
