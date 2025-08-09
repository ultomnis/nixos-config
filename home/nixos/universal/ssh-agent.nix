{ config, ... }:

let
  cfg = config.luminosity.home.desktop.universal.ssh-agent;

in
{
  # OpenSSH private key agent
  services.ssh-agent = {
    inherit (cfg) enable;
  };
}
