{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (config.luminosity.system.selections) desktop;
  cfg = config.luminosity.system.services.greetd;

in
{
  config = lib.mkIf cfg.enable {
    # Login manager daemon
    services.greetd = {
      enable = true;
      vt = 2;

      settings = {
        default_session = {
          # Graphical console greeter
          command = "${lib.getExe pkgs.greetd.tuigreet} --time --remember --cmd ${lib.getExe pkgs.${desktop}}";
        };
      };
    };

    boot.kernelParams = [ "console=tty1" ];
    security.pam.services.greetd.enableGnomeKeyring = true;
  };
}
