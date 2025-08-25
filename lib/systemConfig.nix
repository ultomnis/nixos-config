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
      inherit (inputs)
        agenix
        home-manager
        nix-darwin
        stylix
        ;

      specialArgs = {
        inherit
          customLib
          hostName
          inputs
          ;
      };

    in
    nix-darwin.lib.darwinSystem {
      inherit specialArgs;

      modules = [
        ../hosts/${hostName}

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
          };

          nixpkgs.hostPlatform = system;
        }

        agenix.darwinModules.default
        home-manager.darwinModules.home-manager
        stylix.darwinModules.stylix
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
      inherit (inputs)
        home-manager
        nixpkgs
        stylix
        ;

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

        stylix.homeModules.stylix
      ]
      ++ extraModules;
    };

  mkNixosConfig =
    {
      customLib,
      hostName,
      extraModules ? [ ],
    }:

    let
      inherit (inputs)
        agenix
        home-manager
        nixpkgs
        stylix
        ;

      specialArgs = {
        inherit
          customLib
          hostName
          inputs
          ;
      };

    in
    nixpkgs.lib.nixosSystem {
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

        agenix.nixosModules.default
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
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
      inherit (inputs)
        nix-system-graphics
        system-manager
        ;

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

        nix-system-graphics.systemModules.default
      ]
      ++ extraModules;
    };
}
