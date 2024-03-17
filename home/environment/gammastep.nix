{ inputs, ... }:

{
  imports = [
    "${inputs.nix-secrets}/gammastep.nix"
  ];

  # Adjusts color temperature of the screen
  services.gammastep = {
    enable = true;

    settings = {
      general = {
        adjustment-method = "wayland";
      };
    };
  };
}
