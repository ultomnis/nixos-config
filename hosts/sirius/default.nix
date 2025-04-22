{ hostName, ... }:

{
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/nixos
    ../../options/modules
  ];

  networking.hostName = hostName; # Define your hostname

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "24.05";

  luminosity.system = {
    configurations = {
      enable = true;
      variables.bitwarden.sshAgent.enable = true;
    };

    programs.enable = true;

    selections = {
      desktop = "sway";
      editor = "hx";
      gpu = "amd";
      shell = "fish";
    };

    services = {
      enable = true;
      tailscale.useRoutingFeatures = "client";
    };
  };
}
