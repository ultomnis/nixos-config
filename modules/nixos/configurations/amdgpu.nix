{ config, lib, ... }:

let
  cfg = config.luminosity.modules.system.configurations.amdgpu;

in
{
  config = lib.mkIf cfg.enable {
    hardware.amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
    };

    nixpkgs.config.rocmSupport = true;
  };
}
