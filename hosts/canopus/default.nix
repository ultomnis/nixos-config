{
  imports = [
    ../../modules/darwin
  ];

  # Networking
  networking  = {
    computerName = "canopus";
    hostName = "canopus"; # Define your hostname
  };

  stylix = {
    image = ../../assets/wallpapers/peter-f-fibrknjbpUo-unsplash.jpg;
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = 4;
}

