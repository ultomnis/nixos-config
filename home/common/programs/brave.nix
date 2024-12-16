{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    extensions = [
      { id = "bkdgflcldnnnapblkhphbgpggdiikppg"; } # DuckDuckGo
      { id = "oboonakemofpalcgghocfoadofidjkkk"; } # KeePassXC
    ];
  };
}
