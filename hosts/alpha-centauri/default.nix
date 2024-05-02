{ pkgs, userConfig, ... }:

{
  imports = [
    ./hardware-configuration.nix # Include the results of the hardware scan
    ../../modules
    ../../secrets
  ];

  boot = {
    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Initial ramdisk
    initrd = {
      availableKernelModules = [ "evdev" ];
      systemd.enable = true;
      unl0kr.enable = true; # On-screen keyboard to unlock LUKS
    };
  };

  networking.hostName = "alpha-centauri"; # Define your hostname

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "23.11";

  # Jovian NixOS
  jovian = {
    # Steam Deck
    devices.steamdeck.enable = true;

    # Steam
    steam = {
      enable = true;
      autoStart = true;
      user = "${userConfig.username}";
      desktopSession = "hyprland";
    };
  };

  environment.systemPackages = with pkgs; [
    jupiter-dock-updater-bin
    steamdeck-firmware
  ];
}
