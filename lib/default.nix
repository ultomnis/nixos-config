{
  inputs,
  users,
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
    hostname:
    {
      username,
      system,
      extraModules ? [ ],
    }:

    nixpkgs.lib.nixosSystem {
      system = system;

      specialArgs = {
        inherit inputs;
        userConfig = users.${username};
      };

      modules = [
        ../hosts/${hostname}

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
            };
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
    }:

    nix-darwin.lib.darwinSystem {
      system = system;

      specialArgs = {
        inherit inputs;
        userConfig = users.${username};
      };

      modules = [
        ../hosts/${hostname}

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
            };
          };
        }
      ] ++ extraModules;
    };
}
