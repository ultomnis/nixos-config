{ inputs, ... }:

{
  mkDarwinConfig =
    {
      customLib,
      hostName,
      system,
      extraModules ? [ ],
    }:

    let
      inherit (inputs) nix-darwin;

      specialArgs = {
        inherit
          customLib
          hostName
          inputs
          ;
      };

    in
    nix-darwin.lib.darwinSystem {
      inherit system;
      inherit specialArgs;

      modules = [
        ../hosts/${hostName}

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
          };
        }
      ]
      ++ extraModules;
    };

  mkHomeConfig =
    {
      customLib,
      hostName,
      system,
      username,
      extraModules ? [ ],
    }:

    let
      inherit (inputs) home-manager nixpkgs;

    in
    home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};

      extraSpecialArgs = {
        inherit
          customLib
          hostName
          inputs
          username
          ;
      };

      modules = [
        ../hosts/${hostName}/${username}/home.nix
      ]
      ++ extraModules;
    };

  mkNixosConfig =
    {
      customLib,
      hostName,
      system,
      extraModules ? [ ],
    }:

    let
      inherit (inputs) nixpkgs;

      specialArgs = {
        inherit
          customLib
          hostName
          inputs
          ;
      };

    in
    nixpkgs.lib.nixosSystem {
      inherit system;
      inherit specialArgs;

      modules = [
        ../hosts/${hostName}

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
          };
        }
      ]
      ++ extraModules;
    };

  mkSystemConfig =
    {
      customLib,
      hostName,
      system,
      extraModules ? [ ],
    }:

    let
      inherit (inputs) system-manager;

    in
    system-manager.lib.makeSystemConfig {
      extraSpecialArgs = {
        inherit
          customLib
          hostName
          inputs
          ;
      };

      modules = [
        ../hosts/${hostName}

        {
          nixpkgs.hostPlatform = system;
        }
      ]
      ++ extraModules;
    };
}
