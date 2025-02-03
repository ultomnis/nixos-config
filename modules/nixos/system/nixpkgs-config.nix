{ lib, ... }:

{
  nixpkgs.config = {
    # Permit unfree packages
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "steam"
        "steam-unwrapped"
      ];

    rocmSupport = true;
  };
}
