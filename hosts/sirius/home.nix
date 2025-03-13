{ userConfig, ... }:

{
  imports = [
    ../../home/common
    ../../home/nixos
  ];

  home = {
    username = "${userConfig.name}";
    homeDirectory = "/home/${userConfig.name}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
