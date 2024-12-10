{
  imports = [
    ../../modules/darwin
  ];

  # Networking
  networking = {
    computerName = "canopus";
    hostName = "canopus"; # Define your hostname
  };

  stylix = {
    image = ../../assets/wallpapers/maria-teneva-mo62s5dp0zg-unsplash.jpg;
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = 4;
}
