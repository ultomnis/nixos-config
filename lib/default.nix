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
      system,
      specialArgs,
      extraModules ? [ ],
    }:

    nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = specialArgs;

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
      system,
      specialArgs,
      extraModules ? [ ],
    }:

    nix-darwin.lib.darwinSystem {
      system = system;
      specialArgs = specialArgs;

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
}
