{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.bitwarden;

in
{
  config = lib.mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        bitwarden-desktop
      ];

      sessionVariables = {
        SSH_AUTH_SOCK = lib.mkIf (cfg.sshAgent.enable) "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
      };
    };
  };
}
