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

    rose-pine-tm = {
      url = "github:rose-pine/tm-theme";
      flake = false;
    };
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

      customLib = import ./lib;
      inherit (customLib) mkNixosConfig mkDarwinConfig mkHomeConfig;

    in
    {
      forEachSystem = nixpkgs.lib.genAttrs includedSystems;
      formatter = self.forEachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      nixosConfigurations = {
        sirius = mkNixosConfig {
          inherit customLib inputs;
          hostName = "sirius";
          userName = "user";
          systemType = "x86_64-linux";

          extraModules = [
            disko.nixosModules.disko
          ];
        };
      };

      darwinConfigurations = {
        canopus = mkDarwinConfig {
          inherit customLib inputs;
          hostName = "canopus";
          userName = "user";
          systemType = "aarch64-darwin";
        };
      };

      homeConfigurations = {
        deck = mkHomeConfig {
          inherit customLib inputs;
          hostName = "alpha-centauri";
          userName = "deck";
          systemType = "x86_64-linux";
        };
      };
    };
}
