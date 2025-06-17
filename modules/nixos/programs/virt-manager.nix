{ config, ... }:

let
  cfg = config.luminosity.system.programs.virt-manager;

in
{
  # Manage virtual machines
  programs.virt-manager = {
    inherit (cfg) enable;
  };
}
