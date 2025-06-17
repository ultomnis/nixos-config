{
  config,
  hostName,
  lib,
  pkgs,
  systemOS,
  ...
}:

let
  cfg = config.luminosity.system.configurations.userConfig;
  inherit (config.luminosity.system.programs) adb;

  inherit (config.luminosity.system.services)
    libvirtd
    networkmanager
    ;

in
{
  config = lib.mkIf cfg.enable {
    users =
      {
        users =
          cfg.users
          |> map (user: {
            inherit (user) name;

            value =
              {
                home = if (systemOS == "darwin") then "/Users/${user.name}" else "/home/${user.name}";
                shell = lib.mkIf (user.shell != null) pkgs.${user.shell};
                uid = lib.mkIf (user.uid != null) user.uid;
              }
              |> lib.recursiveUpdate (
                lib.optionalAttrs (systemOS == "linux") {
                  inherit (user) hashedPasswordFile;
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
