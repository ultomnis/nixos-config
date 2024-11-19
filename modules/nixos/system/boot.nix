{ pkgs, ... }:

{
  boot = {
    # Linux kernel
    kernelPackages = pkgs.linuxPackages_latest;
    
    kernelModules = [
      "i2c-dev"
    ];

    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
