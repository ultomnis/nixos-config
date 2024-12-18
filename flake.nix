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
  };

  outputs =
    inputs@{
      self,
      disko,
      home-manager,
      nix-darwin,
      nixpkgs,
      ...
    }:

    let
      desktop = "sirius";
      laptop = "canopus";
      userConfig = {
        username = "user";
        gitName = "ultomnis";
        gitEmail = "125839032+ultomnis@users.noreply.github.com";
      };

    in
    {
      nixosConfigurations = {
        ${desktop} = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs userConfig;
          };
          modules = [
            ./hosts/sirius
            disko.nixosModules.disko

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${userConfig.username} = {
                  imports = [
                    ./hosts/sirius/home.nix
                  ];
                };
                extraSpecialArgs = {
                  inherit inputs userConfig;
                };
              };
            }
          ];
        };
      };

      darwinConfigurations = {
        ${laptop} = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            inherit inputs userConfig;
          };
          modules = [
            ./hosts/canopus

            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${userConfig.username} = {
                  imports = [
                    ./hosts/canopus/home.nix
                  ];
                };
                extraSpecialArgs = {
                  inherit inputs userConfig;
                };
              };
            }
          ];
        };
      };
    };
}
