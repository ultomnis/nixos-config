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

  luminosity.system = {
    configurations = {
      enable = true;
      userConfig.uid = 501;
      variables.bitwarden.sshAgent.enable = true;
    };

    programs.enable = true;

    selections = {
      desktop = "aerospace";
      editor = "hx";
      shell = "fish";
      terminal = "wezterm";
    };

    services.enable = true;
  };
}
