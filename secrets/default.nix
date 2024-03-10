{ nix-secrets, ... }:

{
  age.secrets.user-password = {
    file = "${nix-secrets}/user-password.age";
  };
}
