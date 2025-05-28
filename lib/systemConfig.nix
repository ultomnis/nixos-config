{
  mkNixosConfig =
    {
      customLib,
      inputs,
      hostname,
      systemArch,
      systemOS,
      extraModules ? [ ],
    }:
    let
      inherit (inputs) nixpkgs;

    in
    nixpkgs.lib.nixosSystem rec {
      system = "${systemArch}-${systemOS}";

      specialArgs = {
        inherit
          customLib
          hostname
          inputs
          systemOS
          ;
      };

      modules = [
        ../hosts/${hostname}

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
      inputs,
      hostname,
      systemArch,
      systemOS,
      extraModules ? [ ],
    }:
    let
      inherit (inputs) nix-darwin;

    in
    nix-darwin.lib.darwinSystem rec {
      system = "${systemArch}-${systemOS}";

      specialArgs = {
        inherit
          customLib
          hostname
          inputs
          systemOS
          ;
      };

      modules = [
        ../hosts/${hostname}

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
      inputs,
      hostname,
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
          hostname
          inputs
          systemOS
          ;
      };

      modules = [
        ../hosts/${hostname}
      ] ++ extraModules;
    };
}
