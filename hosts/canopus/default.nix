{ inputs, pkgs, ... }:

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

  # GPU/Firmware
  hardware.asahi = {
    useExperimentalGPUDriver = true;
    experimentalGPUInstallMode = "overlay";
    peripheralFirmwareDirectory = "${inputs.nix-secrets}/firmware";
  };

  # Login manager daemon
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        # tuigreet command to run Hyprland
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${pkgs.hyprland}/bin/Hyprland";
      };
    };
  };

  # Sound
  # sound.enable = true;
}

