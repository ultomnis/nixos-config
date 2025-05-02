let
  mapMonitors = import ./mapMonitors.nix;
  systemConfig = import ./systemConfig.nix;

in
{
  mapSwayMonitors = mapMonitors.mapSwayMonitors;

  mkNixosConfig = systemConfig.mkNixosConfig;
  mkDarwinConfig = systemConfig.mkDarwinConfig;
  mkHomeConfig = systemConfig.mkHomeConfig;
}
