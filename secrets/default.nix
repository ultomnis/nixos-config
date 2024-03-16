{ nix-secrets, ... }:

{
  # Secrets from private repo
  age.secrets = {
    user-password = {
      file = "${nix-secrets}/user-password.age";
    };
  };
}
