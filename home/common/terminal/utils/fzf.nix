{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.fzf;

in
{
  config = lib.mkIf cfg.enable {
    # Command-line fuzzy finder
    programs.fzf = {
      enable = true;

      defaultCommand = "${lib.getExe pkgs.fd} --hidden";
      fileWidgetCommand = "${lib.getExe pkgs.fd} --type f --hidden";
      changeDirWidgetCommand = "${lib.getExe pkgs.fd} --type d --hidden";

      defaultOptions = [
        "--border"
        "--layout reverse"
      ];

      fileWidgetOptions = [
        "--preview '${lib.getExe pkgs.bat} --color=always {}'"
      ];

      changeDirWidgetOptions = [
        "--preview '${lib.getExe pkgs.eza} --tree --level=3 --color=always --icons=always {}'"
      ];
    };
  };
}
