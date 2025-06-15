{ inputs, lib, ... }:

let
  mapMonitors = import ./mapMonitors.nix;

  systemConfig = import ./systemConfig.nix {
    inherit inputs;
  };

in
{
  mapSwayMonitors = mapMonitors.mapSwayMonitors;
  mkDarwinConfig = systemConfig.mkDarwinConfig;
  mkHomeConfig = systemConfig.mkHomeConfig;
  mkNixosConfig = systemConfig.mkNixosConfig;

  selectionTypes = import ./selectionTypes.nix {
    inherit lib;
  };
}
