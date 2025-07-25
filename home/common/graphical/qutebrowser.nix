{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.qutebrowser;

in
{
  # Keyboard-focused browser
  programs.qutebrowser = {
    inherit (cfg) enable;

    keyBindings = {
      normal = {
        ",m" = "spawn ${lib.getExe pkgs.mpv} {url}";
        ",M" = "hint links spawn ${lib.getExe pkgs.mpv} {hint-url}";
      };
    };

    settings = {
      colors = {
        webpage = {
          darkmode.enabled = true;
        };
      };

      confirm_quit = [
        "downloads"
      ];

      content = {
        pdfjs = true;
      };

      fonts = {
        default_family = lib.mkIf (cfg.font.name != null) cfg.font.name;
        default_size = lib.mkIf (cfg.font.size != null) (toString cfg.font.size + "pt");
      };

      scrolling = {
        smooth = true;
      };

      tabs = {
        last_close = "startpage";
        title.format = "{private}{audio}{index}: {current_title}";
      };
    };
  };
}
