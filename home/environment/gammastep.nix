{ nix-secrets, ... }:

{
  imports = [
    "${nix-secrets}/gammastep.nix"
  ];

  # Adjusts color temperature of the screen
  services.gammastep = {
    enable = true;
    tray = true;
  };
}
