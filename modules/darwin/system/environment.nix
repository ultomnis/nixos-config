{ userConfig, ... }:

{
  environment = {
    variables = {
      HOMEBREW_NO_ANALYTICS = "1";
      SSH_AUTH_SOCK = "/Users/${userConfig.name}/.bitwarden-ssh-agent.sock";
    };
  };
}
