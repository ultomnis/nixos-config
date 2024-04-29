{
  description = "ultomnis' NixOS configuration";

  inputs = {
    # Agenix
    agenix.url = "github:ryantm/agenix";
  
    # Apple silicon
    apple-silicon.url = "github:tpwrules/nixos-apple-silicon";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hypridle
    hypridle.url = "github:hyprwm/hypridle";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    # Hyprlock
    hyprlock.url = "github:hyprwm/hyprlock";

    # Hyprpaper
    hyprpaper.url = "github:hyprwm/hyprpaper";

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
    home-manager,
    hypridle,
    hyprland,
    hyprlock,
    hyprpaper,
    nixpkgs,
    nix-secrets,
    ...
  }:
  
  let
    deck = "alpha-centauri";
    laptop = "canopus";
    userConfig = {
      username = "user";
      gitName = "ultomnis";
      gitEmail = "125839032+ultomnis@users.noreply.github.com";
    };

  in {
    nixosConfigurations = {
      ${deck} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs userConfig; };
        modules = [
          ./hosts/alpha-centauri

          agenix.nixosModules.default
          
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${userConfig.username} = {
                imports = [
                  ./hosts/alpha-centauri/home.nix

                  hypridle.homeManagerModules.default
                  hyprlock.homeManagerModules.default
                  hyprpaper.homeManagerModules.default
                ];
              };
              extraSpecialArgs = { inherit inputs userConfig; };
            };
          }
        ];
      };

      ${laptop} = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs userConfig; };
        modules = [
          ./hosts/canopus

          agenix.nixosModules.default
          apple-silicon.nixosModules.default # Apple silicon support
          
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${userConfig.username} = {
                imports = [
                  ./hosts/canopus/home.nix

                  hypridle.homeManagerModules.default
                  hyprlock.homeManagerModules.default
                  hyprpaper.homeManagerModules.default
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
