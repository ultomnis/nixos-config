{
  description = "ultomnis' NixOS and nix-darwin configurations";

  inputs = {
    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Lanzaboote (Secure Boot)
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix-darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Nipkgs-wayland
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix user repository
    nur.url = "github:nix-community/NUR";

    # Stylix
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs@{
    self,
    home-manager,
    lanzaboote,
    nix-darwin,
    nixpkgs,
    nixpkgs-wayland,
    nur,
    stylix,
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

  in {
    nixosConfigurations = {
      ${desktop} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs userConfig; };
        modules = [
          ./hosts/sirius
          lanzaboote.nixosModules.lanzaboote
          stylix.nixosModules.stylix
          
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${userConfig.username} = {
                imports = [
                  ./hosts/sirius/home.nix
                  nur.hmModules.nur
                ];
              };
              extraSpecialArgs = { inherit inputs userConfig; };
            };
          }
        ];
      };
    };

    darwinConfigurations = {
      ${laptop} = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs userConfig; };
        modules = [
          ./hosts/canopus

          home-manager.darwinModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${userConfig.username} = {
                imports = [
                  ./hosts/canopus/home.nix
                  nur.hmModules.nur
                ];
              };
              extraSpecialArgs = { inherit inputs userConfig; };
            };
          }
        ];
      };
    };
  };
}
