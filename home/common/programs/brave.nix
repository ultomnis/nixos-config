{ pkgs, ... }:

{
  # Brave web browser
  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    extensions = [
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # Proton Pass
    ];
  };
}
