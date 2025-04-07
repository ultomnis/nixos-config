{
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/nixos
  ];

  networking.hostName = "sirius"; # Define your hostname

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "24.05";

  services.tailscale.useRoutingFeatures = "client";
}
