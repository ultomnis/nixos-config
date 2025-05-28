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
        users = builtins.listToAttrs (
          map (user: {
            name = user.name;

            value =
              {
                home = if (systemOS == "darwin") then "/Users/${user.name}" else "/home/${user.name}";
                shell = lib.mkIf (shell != null) pkgs.${shell};
                uid = lib.mkIf (user.uid != null) user.uid;
              }
              // lib.optionalAttrs (systemOS == "linux") {
                isNormalUser = true;
                extraGroups =
                  [ "wheel" ]
                  ++ lib.optionals (adb.enable) [
                    "adbusers"
                  ]
                  ++ lib.optionals (libvirtd.enable) [
                    "libvirtd"
                  ]
                  ++ lib.optionals (networkmanager.enable) [
                    "networkmanager"
                  ];
              };
          }) cfg.users
        );
      }
      // lib.optionalAttrs (systemOS == "darwin") {
        knownUsers = map (user: user.name) (builtins.filter (user: user.uid != null) cfg.users);
      };

    home-manager.users = builtins.listToAttrs (
      map (user: {
        name = user.name;

        value = {
          imports = [
            ../../../hosts/${hostname}/${user.name}/home.nix
          ];
        };
      }) (builtins.filter (user: user.homeManager) cfg.users)
    );
  };
}
