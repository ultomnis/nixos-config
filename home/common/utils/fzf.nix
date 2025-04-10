{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Command-line fuzzy finder
  programs.fzf = {
    enable = true;

    defaultCommand = "${lib.getExe pkgs.fd} --type f --hidden";
    fileWidgetCommand = config.programs.fzf.defaultCommand;
    changeDirWidgetCommand = "${lib.getExe pkgs.fd} --type d --hidden";

    defaultOptions = [
      "--border"
      "--layout reverse"
      "--preview 'bat --color=always {}'"
    ];

    changeDirWidgetOptions = [
      "--preview 'eza --tree --level=3 --color=always --icons=always {}'"
    ];

    historyWidgetOptions = [
      "--no-preview"
    ];
  };
}
