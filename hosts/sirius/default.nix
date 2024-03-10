{ pkgs, ... }:

{
  imports = [
    ./disko-config.nix
    ./hardware-configuration.nix # Include the results of the hardware scan
    ../../modules
    ../../secrets
  ];

  boot = {
    # Linux kernel
    kernelPackages = pkgs.linuxPackages_latest;

    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking.hostName = "sirius"; # Define your hostname

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "23.11";
}
