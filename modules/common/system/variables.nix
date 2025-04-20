{ config, lib, ... }:

let
  inherit (config.luminosity.system)
    configurations
    selections
    ;

in
{
  config = lib.mkIf configurations.variables.enable {
    environment = {
      variables = {
        EDITOR = lib.mkIf (selections.editor != null) "${selections.editor}";
        SSH_AUTH_SOCK = lib.mkIf (configurations.variables.bitwarden.sshAgent.enable) "${
          config.users.users.${configurations.primaryUser.name}.home
        }/.bitwarden-ssh-agent.sock";
      };
    };
  };
}
