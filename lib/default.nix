{ inputs, lib, ... }:

let
  mapMonitors = import ./mapMonitors.nix;

  systemConfig = import ./systemConfig.nix {
    inherit inputs;
  };

in
{
  inherit (mapMonitors) mapSwayMonitors;

  inherit (systemConfig)
    mkDarwinConfig
    mkHomeConfig
    mkNixosConfig
    mkSystemConfig
    ;

  selectionTypes = import ./selectionTypes.nix {
    inherit lib;
  };
}
