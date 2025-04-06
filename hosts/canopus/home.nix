{ userConfig, ... }:

{
  imports = [
    ../../home/common
    ../../home/darwin
  ];

  home = {
    username = "${userConfig.name}";
    homeDirectory = "/Users/${userConfig.name}";
    stateVersion = "24.05";
    file.".hushlogin".text = "";
  };

  programs.home-manager.enable = true;
}
