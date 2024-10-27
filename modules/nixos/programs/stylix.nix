{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
    };

    fonts = {
      serif = config.stylix.fonts.sansSerif;
    
      sansSerif = {
        package = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
        name = "Hack Nerd Font Propo";
      };
      
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
        name = "Hack Nerd Font Mono";
      };

      sizes = {
        desktop = 11;
        popups = 11;
      };
    };
  };
}
