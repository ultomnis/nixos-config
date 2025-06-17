{ inputs, ... }:

{
  mkNixosConfig =
    {
      customLib,
      hostName,
      systemArch,
      systemOS,
      extraModules ? [ ],
    }:

    let
      inherit (inputs) nixpkgs;

      specialArgs = {
        inherit
          customLib
          hostName
          inputs
          systemOS
          ;
      };

      system = "${systemArch}-${systemOS}";

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
      systemArch,
      systemOS,
      extraModules ? [ ],
    }:

    let
      inherit (inputs) nix-darwin;

      specialArgs = {
        inherit
          customLib
          hostName
          inputs
          systemOS
          ;
      };

      system = "${systemArch}-${systemOS}";

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
      systemArch,
      systemOS,
      username,
      extraModules ? [ ],
    }:

    let
      inherit (inputs) home-manager nixpkgs;
      system = "${systemArch}-${systemOS}";

    in
    home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};

      extraSpecialArgs = {
        inherit
          customLib
          hostName
          inputs
          systemOS
          username
          ;
      };

      modules = [
        ../hosts/${hostName}/${username}
      ] ++ extraModules;
    };
}
