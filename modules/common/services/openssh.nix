{ config, ... }:

let
  cfg = config.luminosity.system.services.openssh;

in
{
  services.openssh = {
    inherit (cfg) enable;

    extraConfig = ''
      PasswordAuthentication no
      PermitRootLogin no
    '';
  };
}
