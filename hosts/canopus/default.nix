{
  imports = [
    ../../modules/darwin
  ];

  networking = {
    computerName = "canopus";
    hostName = "canopus"; # Define your hostname
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = 6;
}
