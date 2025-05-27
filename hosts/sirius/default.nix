{ hostName, inputs, ... }:

{
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/home
    ../../modules/nixos
    ../../options/common
    ../../options/modules
  ];

  networking.hostName = hostName; # Define your hostname

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
          height = 1920;
          width = 1080;
          name = "DP-2";
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
      configurations.enable = true;
      programs.enable = true;

      services = {
        enable = true;
        tailscale.useRoutingFeatures = "client";
      };
    };
  };
}
