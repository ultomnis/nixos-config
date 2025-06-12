{
  description = "ultomnis' NixOS and nix-darwin configurations";

  inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    nix-secrets = {
      url = "git+ssh://git@github.com/ultomnis/nix-secrets.git?ref=main";
      flake = false;
    };
  };

  outputs =
    {
      self,
      agenix,
      disko,
      home-manager,
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
      formatter = self.forEachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);

      nixosConfigurations = {
        sirius = mkNixosConfig {
          inherit customLib inputs;
          hostname = "sirius";
          systemArch = "x86_64";
          systemOS = "linux";

          extraModules = [
            agenix.nixosModules.default
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
          ];
        };
      };

      darwinConfigurations = {
        canopus = mkDarwinConfig {
          inherit customLib inputs;
          hostname = "canopus";
          systemArch = "aarch64";
          systemOS = "darwin";

          extraModules = [
            agenix.darwinModules.default
            home-manager.darwinModules.home-manager
          ];
        };
      };

      homeConfigurations = {
        deck = mkHomeConfig {
          inherit customLib inputs;
          hostname = "alpha-centauri";
          systemArch = "x86_64";
          systemOS = "linux";
        };
      };
    };
}
