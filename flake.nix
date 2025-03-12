{
  description = "ultomnis' NixOS and nix-darwin configurations";

  inputs = {
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";
  };

  outputs =
    {
      self,
      disko,
      nixpkgs,
      ...
    }@inputs:

    let
      users = {
        user = {
          name = "user";
          gitName = "ultomnis";
          gitEmail = "125839032+ultomnis@users.noreply.github.com";
        };
      };

      includedSystems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];

      mkLib = import ./lib {
        inherit inputs users;
      };

      inherit (mkLib) mkNixosConfig mkDarwinConfig;

    in
    {
      forEachSystem = nixpkgs.lib.genAttrs includedSystems;
      formatter = self.forEachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      nixosConfigurations = {
        sirius = mkNixosConfig "sirius" {
          username = "user";
          system = "x86_64-linux";
          extraModules = [
            disko.nixosModules.disko
          ];
        };
      };

      darwinConfigurations = {
        canopus = mkDarwinConfig "canopus" {
          username = "user";
          system = "aarch64-darwin";
        };
      };
    };
}
