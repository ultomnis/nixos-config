{ inputs, ... }:

{
  # Secrets from private repo
  age.secrets = {
    user-password = {
      file = "${inputs.nix-secrets}/user-password.age";
    };
  };
}
