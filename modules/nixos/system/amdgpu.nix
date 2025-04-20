{ config, lib, ... }:

let
  inherit (config.luminosity.system.selections) gpu;

in
{
  config = lib.mkIf (gpu == "amd") {
    hardware.amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
    };

    nixpkgs.config.rocmSupport = true;
  };
}
