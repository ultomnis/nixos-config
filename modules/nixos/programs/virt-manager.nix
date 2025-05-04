{ config, lib, ... }:

let
  cfg = config.luminosity.system.programs.virt-manager;

in
{
  config = lib.mkIf cfg.enable {
    # Manage virtual machines
    programs.virt-manager.enable = true;
  };
}
