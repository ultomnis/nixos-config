{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    (alpaca.override { ollama = pkgs.ollama-rocm; })
    mullvad-browser
    nexusmods-app-unfree
    solaar
  ];
}
