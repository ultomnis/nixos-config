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
                  ++ lib.optionals (config.luminosity.system.programs.adb.enable) [
                    "adbusers"
                  ]
                  ++ lib.optionals (config.luminosity.system.services.libvirtd.enable) [
                    "libvirtd"
                  ]
                  ++ lib.optionals (config.luminosity.system.services.networkmanager.enable) [
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
