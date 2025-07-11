{
  description = "ultomnis' Nix configurations";

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

    nix-system-graphics = {
      url = "github:soupglasses/nix-system-graphics";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      agenix,
      disko,
      home-manager,
      nixpkgs,
      nix-system-graphics,
      ...
    }@inputs:

    let
      includedSystems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];

      customLib = import ./lib {
        inherit inputs;
        inherit (nixpkgs) lib;
      };

      inherit (customLib)
        mkDarwinConfig
        mkHomeConfig
        mkNixosConfig
        mkSystemConfig
        ;

    in
    {
      forEachSystem = nixpkgs.lib.genAttrs includedSystems;
      formatter = self.forEachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);

      darwinConfigurations = {
        canopus = mkDarwinConfig {
          inherit customLib;
          hostName = "canopus";
          system = "aarch64-darwin";

          extraModules = [
            agenix.darwinModules.default
            home-manager.darwinModules.home-manager
          ];
        };
      };

      homeConfigurations = {
        "deck@alpha-centauri" = mkHomeConfig {
          inherit customLib;
          hostName = "alpha-centauri";
          system = "x86_64-linux";
          username = "deck";
        };
      };

      nixosConfigurations = {
        sirius = mkNixosConfig {
          inherit customLib;
          hostName = "sirius";
          system = "x86_64-linux";

          extraModules = [
            agenix.nixosModules.default
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
          ];
        };
      };

      systemConfigs = {
        alpha-centauri = mkSystemConfig {
          inherit customLib;
          hostName = "alpha-centauri";
          system = "x86_64-linux";

          extraModules = [
            nix-system-graphics.systemModules.default
          ];
        };
      };
    };
}
