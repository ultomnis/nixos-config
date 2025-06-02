{ config, hostname, inputs, ... }:

{
  imports = [
    ../../modules/common
    ../../modules/home
    ../../modules/nixos
    ../../options/common
    ../../options/modules

    ./disk-config.nix
    ./hardware-configuration.nix
    ../../secrets/modules.nix
  ];

  networking.hostName = hostname; # Define your hostname

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "24.05";

  luminosity = {
    selections = {
      desktop = "sway";
      editor = "helix";
      gpu = "amd";

      monitors = [
        {
          output = "DP-2";
          height = 1920;
          width = 1080;
          pos_x = 0;
          pos_y = 0;
          rate = 165;
        }
      ];

      shell = "fish";
      terminal = "wezterm";
    };

    stylix = {
      enable = true;
      fonts.terminalSize = 10;
      image = inputs.self + "/assets/wallpapers/kemo-sahab-4V0tz5FEvTc-unsplash.jpg";
    };

    system = {
      configurations = {
        enable = true;
        userConfig.users = [
          {
            hashedPasswordFile = config.age.secrets.sirius-user-passwd.path;
            homeManager = true;
            name = "user";
          }
        ];
      };

      programs.enable = true;

      services = {
        enable = true;
        tailscale.useRoutingFeatures = "client";
      };
    };
  };
}
