{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (config.luminosity.home.selections)
    shell
    terminal
    ;

  inherit (config.luminosity.home.desktop.environment)
    fonts
    themes
    ;

in
{
  config = lib.mkIf (terminal == "foot") {
    # Wayland terminal emulator
    programs.foot = {
      enable = true;

      settings = {
        main = {
          font = "${fonts.mono}:size=${toString fonts.size}";
          include = "${pkgs.foot.themes}/share/foot/themes/${themes.name}";
          pad = "5x5";
          shell = lib.mkIf (shell != null) (lib.getExe pkgs.${shell});
        };

        mouse = {
          hide-when-typing = "yes";
        };
      };
    };
  };
}
