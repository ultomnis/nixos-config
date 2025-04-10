{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    utm
  ];
}
