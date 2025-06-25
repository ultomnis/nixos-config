{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.environment.kvantum;

in
{
  config = lib.mkIf cfg.enable {
    # Qt theme engine
    qt = {
      inherit (cfg) enable;
      style.name = "kvantum";
    };

    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=rose-pine-foam
      '';

      "Kvantum/rose-pine-foam".source = "${pkgs.rose-pine-kvantum}/share/Kvantum/themes/rose-pine-foam";
    };
  };
}
