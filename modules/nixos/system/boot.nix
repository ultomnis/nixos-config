{ pkgs, ... }:

{
  boot = {
    # Linux kernel
    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [ "console=tty1" ];

    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
