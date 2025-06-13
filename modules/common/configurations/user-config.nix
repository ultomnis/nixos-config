{
  config,
  hostname,
  lib,
  pkgs,
  systemOS,
  ...
}:

let
  cfg = config.luminosity.system.configurations.userConfig;
  adb = config.luminosity.system.programs.adb;
  libvirtd = config.luminosity.system.services.libvirtd;
  networkmanager = config.luminosity.system.services.networkmanager;
  inherit (config.luminosity.selections) shell;

in
{
  config = lib.mkIf cfg.enable {
    users =
      {
        users =
          cfg.users
          |> map (user: {
            name = user.name;

            value =
              {
                home = if (systemOS == "darwin") then "/Users/${user.name}" else "/home/${user.name}";
                shell = lib.mkIf (shell != null) pkgs.${shell};
                uid = lib.mkIf (user.uid != null) user.uid;
              }
              |> lib.recursiveUpdate (
                lib.optionalAttrs (systemOS == "linux") {
                  hashedPasswordFile = user.hashedPasswordFile;
                  isNormalUser = true;
                  extraGroups =
                    [
                      "wheel"
                    ]
                    ++ lib.optionals (adb.enable) [
                      "adbusers"
                    ]
                    ++ lib.optionals (libvirtd.enable) [
                      "libvirtd"
                    ]
                    ++ lib.optionals (networkmanager.enable) [
                      "networkmanager"
                    ];
                }
              );
          })
          |> builtins.listToAttrs;
      }
      |> lib.recursiveUpdate (
        lib.optionalAttrs (systemOS == "darwin") {
          knownUsers = cfg.users |> builtins.filter (user: user.uid != null) |> map (user: user.name);
        }
      );

    home-manager.users =
      cfg.users
      |> builtins.filter (user: user.homeManager)
      |> map (user: {
        name = user.name;

        value = {
          imports = [
            ../../../hosts/${hostname}/${user.name}/home.nix
          ];
        };
      })
      |> builtins.listToAttrs;
  };
}
