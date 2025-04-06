{ vars, ... }:

{
  environment = {
    variables = {
      EDITOR = "hx";
      SSH_AUTH_SOCK = "/home/${vars.userConfig.name}/.bitwarden-ssh-agent.sock";
    };
  };
}
