{ inputs, ... }:

{
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
      ] ++ extraModules;
    };

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
      ] ++ extraModules;
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
        ../hosts/${hostName}/${username}
      ] ++ extraModules;
    };
}
