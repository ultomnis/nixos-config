{
  config,
  lib,
  osConfig ? null,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.superfile;
  editor =
    if (osConfig != null) then
      osConfig.luminosity.selections.editor
    else
      config.luminosity.selections.editor;

in
{
  config = lib.mkIf cfg.enable {
    # Terminal file manager
    programs.superfile = {
      enable = true;

      settings = {
        theme = "rose-pine";
        editor = editor;
        dir_editor = editor;
        auto_check_update = false;
        cd_on_quit = false;
        default_open_file_preview = true;
        show_image_preview = true;
        default_directory = ".";
        file_size_use_si = false;
        default_sort_type = 0;
        sort_order_reversed = false;
        case_sensitive_sort = false;
        debug = false;
        nerdfont = true;
        transparent_background = false;
        file_preview_width = 0;
        code_previewer = "bat";
        sidebar_width = 20;
        border_top = "━";
        border_bottom = "━";
        border_left = "┃";
        border_right = "┃";
        border_top_left = "┏";
        border_top_right = "┓";
        border_bottom_left = "┗";
        border_bottom_right = "┛";
        border_middle_left = "┣";
        border_middle_right = "┫";
        metadata = false;
        enable_md5_checksum = false;
      };
    };
  };
}
