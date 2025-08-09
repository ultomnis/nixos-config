{ config, ... }:

let
  cfg = config.luminosity.modules.services.openssh;

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
