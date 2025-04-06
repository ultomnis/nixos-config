{ vars, ... }:

{
  environment = {
    variables = {
      HOMEBREW_NO_ANALYTICS = "1";
      SSH_AUTH_SOCK = "/Users/${vars.userConfig.name}/.bitwarden-ssh-agent.sock";
    };
  };
}
