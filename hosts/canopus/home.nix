{ userConfig, ... }:

{
  imports = [
    ../../home/common
  ];

  home = {
    username = "${userConfig.name}";
    homeDirectory = "/Users/${userConfig.name}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  programs.ghostty = {
    settings = {
      font-size = 13;
    };
  };
}
