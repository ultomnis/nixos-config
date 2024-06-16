{ userConfig, ... }:

{
  # Wallpaper utility
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "/home/${userConfig.username}/.config/wallpaper.jpg"
      ];

      splash = false;
    };
  };  
}
