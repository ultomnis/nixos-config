{ config, vars, ... }:

let
  userHome = config.users.users.${vars.userConfig.name}.home;

in
{
  environment = {
    variables = {
      EDITOR = "hx";
      SSH_AUTH_SOCK = "${userHome}/.bitwarden-ssh-agent.sock";
    };
  };
}
