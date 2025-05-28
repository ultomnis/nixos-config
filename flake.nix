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

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      disko,
      home-manager,
      nixpkgs,
      stylix,
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
          hostname = "sirius";
          systemArch = "x86_64";
          systemOS = "linux";

          extraModules = [
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
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
            home-manager.darwinModules.home-manager
            stylix.darwinModules.stylix
          ];
        };
      };

      homeConfigurations = {
        deck = mkHomeConfig {
          inherit customLib inputs;
          hostname = "alpha-centauri";
          systemArch = "x86_64";
          systemOS = "linux";

          extraModules = [
            stylix.homeModules.stylix
          ];
        };
      };
    };
}
