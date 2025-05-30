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
      packages = builtins.attrValues {
        inherit (pkgs) bitwarden-desktop;
      };

      sessionVariables = lib.optionalAttrs (cfg.sshAgent.enable) {
        SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
      };
    };
  };
}
