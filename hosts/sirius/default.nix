{ pkgs, ... }:

{
  imports = [
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
  system.stateVersion = "24.05";

  # Steam client
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Steam Remote Play
  };
}
