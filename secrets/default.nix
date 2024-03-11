{ nix-secrets, ... }:

{
  imports = [
    "${nix-secrets}/syncthing.nix"
  ];

  age.secrets = {
    user-password = {
      file = "${nix-secrets}/user-password.age";
    };
  };
}
