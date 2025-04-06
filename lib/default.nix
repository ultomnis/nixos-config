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
    hostname:
    {
      username,
      system,
      specialArgs,
      extraModules ? [ ],
    }:

    nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = specialArgs;

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

            extraSpecialArgs = specialArgs;
          };
        }
      ] ++ extraModules;
    };

  mkDarwinConfig =
    hostname:
    {
      username,
      system,
      specialArgs,
      extraModules ? [ ],
    }:

    nix-darwin.lib.darwinSystem {
      system = system;
      specialArgs = specialArgs;

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

            extraSpecialArgs = specialArgs;
          };
        }
      ] ++ extraModules;
    };
}
