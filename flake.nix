{
  description = "ultomnis' NixOS configuration";

  inputs = {
    # Agenix
    agenix.url = "github:ryantm/agenix";
  
    # Apple silicon
    apple-silicon.url = "github:tpwrules/nixos-apple-silicon";

    # Disko
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Personal, private repo
    nix-secrets = {
      url = "git+ssh://git@github.com/ultomnis/nix-secrets.git?ref=main";
      flake = false;
    };
  };

  outputs = inputs@{
    self,
    agenix,
    apple-silicon,
    disko,
    home-manager,
    hyprland,
    nixpkgs,
    nix-secrets,
    ...
  }:
  
  let
    desktop = "sirius";
    laptop = "canopus";
    username = "user";

  in {
    nixosConfigurations = {
      ${desktop} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/sirius

          agenix.nixosModules.default
          disko.nixosModules.disko

          {
            environment.systemPackages = [ agenix.packages."x86_64-linux".default ];
          }
          
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = {
                imports = [
                  ./hosts/sirius/home.nix
                ];
              };
              extraSpecialArgs = { inherit inputs; };
            };
          }
        ];
      };

      ${laptop} = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/canopus

          agenix.nixosModules.default
          apple-silicon.nixosModules.default # Apple silicon support

          {
            environment.systemPackages = [ agenix.packages."aarch64-linux".default ];
          }
          
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = {
                imports = [
                  ./hosts/canopus/home.nix
                ];
              };
              extraSpecialArgs = { inherit inputs; };
            };
          }
        ];
      };
    };
  };
}
