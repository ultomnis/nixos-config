{
  config,
  hostName,
  lib,
  ...
}:

let
  cfg = config.luminosity.system.configurations.userConfig;

in
{
  config = lib.mkIf cfg.enable {
    home-manager.users =
      cfg.users
      |> builtins.filter (user: user.homeManager)
      |> map (user: {
        inherit (user) name;

        value = {
          imports = [
            ../../../hosts/${hostName}/${user.name}/home.nix
          ];
        };
      })
      |> builtins.listToAttrs;
  };
}
