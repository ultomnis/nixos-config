{ userConfig, ... }:

{
  environment = {
    variables = {
      EDITOR = "hx";
      SSH_AUTH_SOCK = "/home/${userConfig.name}/.bitwarden-ssh-agent.sock";
    };
  };
}
