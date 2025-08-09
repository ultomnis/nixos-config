{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.modules.system.configurations.boot;

in
{
  config = lib.mkIf cfg.enable {
    boot = {
      # Linux kernel
      kernelPackages = pkgs.linuxPackages_latest;

      # Bootloader
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };
  };
}
