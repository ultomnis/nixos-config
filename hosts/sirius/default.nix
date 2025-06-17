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
    ../../options/common
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
      editor = "helix";
      gpu = "amd";

      monitors = lib.singleton {
        name = "DP-2";
        height = 1920;
        width = 1080;
        pos_x = 0;
        pos_y = 0;
        rate = 165;
      };

      shell = "fish";
      terminal = "wezterm";
      wallpaper = inputs.self + "/assets/wallpapers/bence-balla-schottner-zwAevXBnEN0-unsplash.jpg";
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
