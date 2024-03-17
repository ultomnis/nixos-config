{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix # Include the results of the hardware scan
    ../../modules
    ../../secrets
  ];

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = false;
  };

  networking.hostName = "canopus"; # Define your hostname

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "24.05";

  environment.systemPackages = [
    inputs.agenix.packages."aarch64-linux".default
  ];

  # GPU
  hardware.asahi.useExperimentalGPUDriver = true;

  # Sound
  sound.enable = true;
}

