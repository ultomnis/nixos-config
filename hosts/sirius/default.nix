{
  imports = [
    ./hardware-configuration.nix # Include the results of the hardware scan
    ../../modules/nixos
  ];

  networking.hostName = "sirius"; # Define your hostname

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "24.05";
}
