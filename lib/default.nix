{
  inputs,
  users,
}:

let
  inherit (inputs)
    home-manager
    nixpkgs
    nix-darwin
    nur
    ;

in
{
  mkNixosConfig =
    hostname:
    {
      username,
      system,
      extraModules ? [ ],
      additionalSpecialArgs ? { },
    }:

    nixpkgs.lib.nixosSystem {
      system = system;

      specialArgs = {
        inherit inputs;
        userConfig = users.${username};
      };

      modules = [
        ../hosts/${hostname}

        { nixpkgs.overlays = [ nur.overlays.default ]; }

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users.${username} = {
              imports = [
                ../hosts/${hostname}/home.nix
              ];
            };

            extraSpecialArgs = {
              inherit inputs;
              userConfig = users.${username};
            } // additionalSpecialArgs;
          };
        }
      ] ++ extraModules;
    };

  mkDarwinConfig =
    hostname:
    {
      username,
      system,
      extraModules ? [ ],
      additionalSpecialArgs ? { },
    }:

    nix-darwin.lib.darwinSystem {
      system = system;

      specialArgs = {
        inherit inputs;
        userConfig = users.${username};
      };

      modules = [
        ../hosts/${hostname}

        { nixpkgs.overlays = [ nur.overlays.default ]; }

        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users.${username} = {
              imports = [
                ../hosts/${hostname}/home.nix
              ];
            };

            extraSpecialArgs = {
              inherit inputs;
              userConfig = users.${username};
            } // additionalSpecialArgs;
          };
        }
      ] ++ extraModules;
    };
}
