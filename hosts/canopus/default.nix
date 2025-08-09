{ hostName, lib, ... }:

{
  imports = [
    ../../modules/common
    ../../modules/darwin
    ../../options/modules
    ../../shared

    ../../secrets/modules.nix
  ];

  networking = {
    computerName = hostName;
    inherit hostName;
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system = {
    stateVersion = 6;
    primaryUser = "user";
  };

  luminosity = {
    modules = {
      configurations = {
        enable = true;

        userConfig.users = lib.singleton {
          homeManager = true;
          name = "user";
          uid = 501;
        };
      };

      programs.enable = true;

      selections = {
        desktop = "aerospace";
        shell = "fish";
      };

      services.enable = true;
    };

    stylix = {
      enable = true;

      fonts = {
        applicationSize = 13;
        desktopSize = 13;
        popupSize = 13;
        terminalSize = 13;
      };
    };
  };
}
