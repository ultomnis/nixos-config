{
  imports = [
    ./disk-config.nix
    ../../modules/nixos
  ];

  networking.hostName = "sirius"; # Define your hostname

  stylix = {
    image = ../../assets/wallpapers/ernest-brillo-JNe3j45DzOU-unsplash.jpg;
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "24.05";
}
