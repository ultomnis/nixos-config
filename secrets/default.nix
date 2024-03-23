{ inputs, pkgs, ... }:

{
  # Private repo modules
  imports = [
    "${inputs.nix-secrets}/syncthing.nix"
    "${inputs.nix-secrets}/users.nix"
  ];

  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.system}.default
  ];

  # Encrypted secrets
  age.secrets = {
    user-password = {
      file = "${inputs.nix-secrets}/user-password.age";
    };
  };
}
