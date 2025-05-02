{
  mkNixosConfig =
    {
      customLib,
      inputs,
      hostName,
      userName,
      systemType,
      extraModules ? [ ],
    }:
    let
      inherit (inputs) home-manager nixpkgs;

    in
    nixpkgs.lib.nixosSystem rec {
      system = systemType;

      specialArgs = {
        inherit
          customLib
          hostName
          inputs
          userName
          ;
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
      customLib,
      inputs,
      hostName,
      userName,
      systemType,
      extraModules ? [ ],
    }:
    let
      inherit (inputs) home-manager nix-darwin;

    in
    nix-darwin.lib.darwinSystem rec {
      system = systemType;

      specialArgs = {
        inherit
          customLib
          hostName
          inputs
          userName
          ;
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
      customLib,
      inputs,
      hostName,
      userName,
      systemType,
      extraModules ? [ ],
    }:
    let
      inherit (inputs) home-manager nixpkgs;

    in
    home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${systemType};

      extraSpecialArgs = {
        inherit
          customLib
          hostName
          inputs
          userName
          ;
      };

      modules = [
        ../hosts/${hostName}/home.nix
      ] ++ extraModules;
    };
}
