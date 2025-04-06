{ vars, ... }:

{
  imports = [
    ../../home/common
    ../../home/darwin
  ];

  home = {
    username = "${vars.userConfig.name}";
    homeDirectory = "/Users/${vars.userConfig.name}";
    stateVersion = "24.05";
    file.".hushlogin".text = "";
  };

  programs.home-manager.enable = true;
}
