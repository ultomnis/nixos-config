{ hostName, ... }:

{
  imports = [
    ../../modules/common
    ../../modules/darwin
    ../../options/modules
  ];

  networking = {
    computerName = hostName;
    hostName = hostName; # Define your hostname
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = 6;

  luminosity = {
    selections = {
      desktop = "aerospace";
      editor = "hx";
      shell = "fish";
      terminal = "wezterm";
    };

    system = {
      configurations = {
        enable = true;
        userConfig.uid = 501;
      };

      programs.enable = true;
      services.enable = true;
    };
  };
}
