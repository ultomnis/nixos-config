{
  config,
  lib,
  userName,
  ...
}:

let
  inherit (config.luminosity.system)
    configurations
    programs
    selections
    ;

in
{
  config = lib.mkIf configurations.variables.enable {
    environment = {
      variables = {
        EDITOR = lib.mkIf (selections.editor != null) selections.editor;
        HOMEBREW_NO_ANALYTICS = lib.mkIf (programs.homebrew.enable) "1";

        SSH_AUTH_SOCK = lib.mkIf (configurations.variables.bitwarden.sshAgent.enable) "${
          config.users.users.${userName}.home
        }/.bitwarden-ssh-agent.sock";

        TERMINAL = lib.mkIf (selections.terminal != null) selections.terminal;
      };
    };
  };
}
