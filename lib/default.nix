{
  inputs,
}:

let
  inherit (inputs)
    home-manager
    nixpkgs
    nix-darwin
    ;

in
{
  mkNixosConfig =
    {
      hostName,
      userName,
      systemType,
      extraModules ? [ ],
    }:

    nixpkgs.lib.nixosSystem rec {
      system = systemType;

      specialArgs = {
        inherit hostName inputs userName;
      };

      modules = [
        ../hosts/${hostName}

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users.${userName} = {
              imports = [
                ../hosts/${hostName}/home.nix
              ];
            };

            extraSpecialArgs = specialArgs;
          };
        }
      ] ++ extraModules;
    };

  mkDarwinConfig =
    {
      hostName,
      userName,
      systemType,
      extraModules ? [ ],
    }:

    nix-darwin.lib.darwinSystem rec {
      system = systemType;

      specialArgs = {
        inherit hostName inputs userName;
      };

      modules = [
        ../hosts/${hostName}

        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users.${userName} = {
              imports = [
                ../hosts/${hostName}/home.nix
              ];
            };

            extraSpecialArgs = specialArgs;
          };
        }
      ] ++ extraModules;
    };

  mkHomeConfig =
    {
      hostName,
      userName,
      systemType,
      extraModules ? [ ],
    }:

    home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${systemType};

      extraSpecialArgs = {
        inherit hostName inputs userName;
      };

      modules = [
        ../hosts/${hostName}/home.nix
      ] ++ extraModules;
    };
}
