{ system, ... }:

{
  nixpkgs.hostPlatform = system;
  system-manager.allowAnyDistro = true;
  system-graphics.enable = true;
}
