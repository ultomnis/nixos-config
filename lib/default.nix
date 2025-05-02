let
  systemConfig = import ./systemConfig.nix;

in
{
  mkNixosConfig = systemConfig.mkNixosConfig;
  mkDarwinConfig = systemConfig.mkDarwinConfig;
  mkHomeConfig = systemConfig.mkHomeConfig;
}
