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
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      disko,
      nixpkgs,
      ...
    }@inputs:

    let
      includedSystems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];

      mkLib = import ./lib {
        inherit inputs;
      };

      inherit (mkLib) mkNixosConfig mkDarwinConfig;

    in
    {
      forEachSystem = nixpkgs.lib.genAttrs includedSystems;
      formatter = self.forEachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      nixosConfigurations = {
        sirius = mkNixosConfig rec {
          hostName = "sirius";
          userName = "user";
          system = "x86_64-linux";

          specialArgs = {
            inherit hostName inputs userName;
          };

          extraModules = [
            disko.nixosModules.disko
          ];
        };
      };

      darwinConfigurations = {
        canopus = mkDarwinConfig rec {
          hostName = "canopus";
          userName = "user";
          system = "aarch64-darwin";

          specialArgs = {
            inherit hostName inputs userName;
          };
        };
      };
    };
}
