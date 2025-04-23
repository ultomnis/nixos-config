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
    ;

  inherit (config.luminosity.selections)
    editor
    terminal
    ;

in
{
  config = lib.mkIf configurations.variables.enable {
    environment = {
      variables = {
        EDITOR = lib.mkIf (editor != null) editor;
        HOMEBREW_NO_ANALYTICS = lib.mkIf (programs.homebrew.enable) "1";

        SSH_AUTH_SOCK = lib.mkIf (configurations.variables.bitwarden.sshAgent.enable) "${
          config.users.users.${userName}.home
        }/.bitwarden-ssh-agent.sock";

        TERMINAL = lib.mkIf (terminal != null) terminal;
      };
    };
  };
}
