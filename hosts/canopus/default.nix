{
  imports = [
    ../../modules/common
    ../../modules/darwin
    ../../options/modules
  ];

  networking = {
    computerName = "canopus";
    hostName = "canopus"; # Define your hostname
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = 6;

  luminosity.system = {
    configurations = {
      enable = true;

      primaryUser = {
        name = "user";
        uid = 501;
      };

      variables.bitwarden.sshAgent.enable = true;
    };

    selections = {
      desktop = "aerospace";
      editor = "hx";
      shell = "fish";
    };

    services.enable = true;
  };
}
