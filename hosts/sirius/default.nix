{
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  networking.hostName = "sirius"; # Define your hostname

  stylix = {
    image = ../../assets/wallpapers/kemo-sahab-4V0tz5FEvTc-unsplash.jpg;
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "24.05";
}
