{ inputs, pkgs, ... }:

{
  xdg = {
    # SVG-based theme engine
    configFile."Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=KvGnomeDark
    '';
  };
}
