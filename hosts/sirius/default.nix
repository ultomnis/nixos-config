{
  config,
  hostName,
  inputs,
  lib,
  ...
}:

{
  imports = [
    ../../modules/common
    ../../modules/nixos
    ../../options/modules
    ../../shared

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
    modules = {
      configurations = {
        enable = true;

        userConfig.users = lib.singleton {
          hashedPasswordFile = config.age.secrets.sirius-user-passwd.path;
          homeManager = true;
          name = "user";
        };
      };

      programs.enable = true;

      selections = {
        desktop = "sway";
        gpu = "amd";
        shell = "fish";
      };

      services.enable = true;
    };

    stylix = {
      enable = true;

      fonts = {
        applicationSize = 10;
        desktopSize = 10;
        popupSize = 10;
        terminalSize = 10;
      };

      image = "${inputs.self}/assets/wallpapers/bence-balla-schottner-zwAevXBnEN0-unsplash.jpg";
    };
  };
}
