{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.openssh;

in
{
  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;

      extraConfig = ''
        PasswordAuthentication no
        PermitRootLogin no
      '';
    };
  };
}
