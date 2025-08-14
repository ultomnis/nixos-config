{ inputs, ... }:

{
  imports = [
    "${inputs.nix-secrets}/syncthing.nix"
  ];
}
