{ userConfig, ... }:

{
  imports = [
    ../../home
  ];

  home = {
    username = "${userConfig.username}";
    homeDirectory = "/home/${userConfig.username}";
    stateVersion = "23.05";
    # Source the wallpaper file
    file.".config/wallpaper.jpg".source = ../../assets/wallpapers/michael-diane-weidner-u8X0HCV2X1Y-unsplash.jpg;
  };

  programs.home-manager.enable = true;
}
