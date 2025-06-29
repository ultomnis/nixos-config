{
  config,
  hostName,
  lib,
  ...
}:

{
  imports = [
    ../../modules/common
    ../../modules/nixos
    ../../options/modules

    ./disk-config.nix
    ./hardware-configuration.nix
    ../../secrets/modules.nix
  ];

  networking = {
    inherit hostName;
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "24.05";

  luminosity = {
    selections = {
      desktop = "sway";
      gpu = "amd";
      shell = "fish";
    };

    system = {
      configurations = {
        enable = true;

        userConfig.users = lib.singleton {
          hashedPasswordFile = config.age.secrets.sirius-user-passwd.path;
          homeManager = true;
          name = "user";
        };
      };

      programs.enable = true;

      services = {
        enable = true;
        tailscale.useRoutingFeatures = "client";
      };
    };
  };
}
