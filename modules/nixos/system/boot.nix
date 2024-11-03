{ lib, pkgs, ... }:

{
  boot = {
    # Linux kernel
    kernelPackages = pkgs.linuxPackages_latest;

    # Secure boot
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    # Bootloader
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };
  };
}
