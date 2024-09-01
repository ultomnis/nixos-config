{ pkgs, ... }:

{
  boot = {
    # Linux kernel
    kernelPackages = pkgs.linuxPackages_testing;

    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
