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
    # Clean up Wayland sockets on exit
    (pkgs.writeShellScriptBin "hyprexit" ''
      ${hyprland}/bin/hyprctl dispatch exit
      ${systemd}/bin/loginctl terminate-user ${userConfig.username}
    '')
    jupiter-dock-updater-bin
    steamdeck-firmware
  ];
}
