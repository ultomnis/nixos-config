{ inputs, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.system}.default
  ];

  age.secrets = {
    sirius-user-passwd = {
      file = "${inputs.nix-secrets}/sirius-user-passwd.age";
    };
  };
}
