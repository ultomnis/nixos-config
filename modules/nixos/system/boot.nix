{ pkgs, ... }:

{
  boot = {
    # Linux kernel
    kernelPackages = pkgs.linuxPackages_latest;

    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
