{ pkgs, ... }:

{
  # GUI programs
  home.packages = with pkgs; [
    mullvad-browser
    pwvucontrol
  ];
}
