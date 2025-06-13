{ hostname, lib, ... }:

{
  imports = [
    ../../modules/common
    ../../modules/darwin
    ../../options/common
    ../../options/modules

    ../../secrets/modules.nix
  ];

  networking = {
    computerName = hostname;
    hostName = hostname; # Define your hostname
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system = {
    stateVersion = 6;
    primaryUser = "user";
  };

  luminosity = {
    selections = {
      desktop = "aerospace";
      editor = "helix";
      shell = "fish";
      terminal = "wezterm";
    };

    system = {
      configurations = {
        enable = true;

        userConfig.users = lib.singleton {
          homeManager = true;
          name = "user";
          uid = 501;
        };
      };

      programs.enable = true;
      services.enable = true;
    };
  };
}
