{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.modules.system.configurations.userConfig;

in
{
  config = lib.mkIf cfg.enable {
    users = {
      users =
        cfg.users
        |> map (user: {
          inherit (user) name;

          value = {
            home = "/Users/${user.name}";
            shell = lib.mkIf (user.shell != null) pkgs.${user.shell};
            uid = lib.mkIf (user.uid != null) user.uid;
          };
        })
        |> builtins.listToAttrs;

      knownUsers = cfg.users |> builtins.filter (user: user.uid != null) |> map (user: user.name);
    };
  };
}
