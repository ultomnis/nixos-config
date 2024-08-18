{ userConfig, ... }:

{
  imports = [
    ../../home/common
    ../../home/darwin
  ];

  home = {
    username = "${userConfig.username}";
    homeDirectory = "/Users/${userConfig.username}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
