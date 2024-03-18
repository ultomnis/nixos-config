{ inputs, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.system}.default
  ];

  # Secrets from private repo
  age.secrets = {
    user-password = {
      file = "${inputs.nix-secrets}/user-password.age";
    };
  };
}
