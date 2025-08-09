{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.modules.system.configurations.userConfig;
  inherit (config.luminosity.modules.system.programs) adb;

  inherit (config.luminosity.modules.system.services)
    libvirtd
    networkmanager
    ;

in
{
  config = lib.mkIf cfg.enable {
    users = {
      users =
        cfg.users
        |> map (user: {
          inherit (user) name;

          value = {
            isNormalUser = true;
            home = "/home/${user.name}";
            shell = lib.mkIf (user.shell != null) pkgs.${user.shell};

            inherit (user)
              hashedPasswordFile
              uid
              ;

            extraGroups = [
              "wheel"
            ]
            ++ lib.optional (adb.enable) "adbusers"
            ++ lib.optional (libvirtd.enable) "libvirtd"
            ++ lib.optional (networkmanager.enable) "networkmanager";
          };
        })
        |> builtins.listToAttrs;
    };
  };
}
