{ config, ... }:

let
  cfg = config.luminosity.home.universal.ssh-agent;

in
{
  # OpenSSH private key agent
  services.ssh-agent = {
    inherit (cfg) enable;
  };
}
