{ self, userConfig, ... }:

{
  imports = [
    "${self}/home/common"
    "${self}/home/darwin"
  ];

  home = {
    username = "${userConfig.name}";
    homeDirectory = "/Users/${userConfig.name}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
