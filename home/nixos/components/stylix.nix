{ pkgs, ... }:

{
  stylix = {
    iconTheme = {
      enable = true;
      package = pkgs.kora-icon-theme;
      dark = "kora";
      light = "kora";
    };
  };
}
