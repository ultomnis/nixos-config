{ inputs, lib, ... }:

let
  selectionTypes = import ./selectionTypes.nix {
    inherit lib;
  };

  systemConfig = import ./systemConfig.nix {
    inherit inputs;
  };

in
{
  inherit selectionTypes;

  inherit (systemConfig)
    mkDarwinConfig
    mkHomeConfig
    mkNixosConfig
    mkSystemConfig
    ;
}
