{
  mkNixosConfig =
    {
      customLib,
      inputs,
      hostName,
      userName,
      systemArch,
      systemOS,
      extraModules ? [ ],
    }:
    let
      inherit (inputs) home-manager nixpkgs;

    in
    nixpkgs.lib.nixosSystem rec {
      system = "${systemArch}-${systemOS}";

      specialArgs = {
        inherit
          customLib
          hostName
          inputs
          systemOS
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
      systemArch,
      systemOS,
      extraModules ? [ ],
    }:
    let
      inherit (inputs) home-manager nix-darwin;

    in
    nix-darwin.lib.darwinSystem rec {
      system = "${systemArch}-${systemOS}";

      specialArgs = {
        inherit
          customLib
          hostName
          inputs
          systemOS
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
      systemArch,
      systemOS,
      extraModules ? [ ],
    }:
    let
      inherit (inputs) home-manager nixpkgs;
      system = "${systemArch}-${systemOS}";

    in
    home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."${system}";

      extraSpecialArgs = {
        inherit
          customLib
          hostName
          inputs
          systemOS
          userName
          ;
      };

      modules = [
        ../hosts/${hostName}/home.nix
      ] ++ extraModules;
    };
}
