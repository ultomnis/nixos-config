{
  # Terminal file manager
  programs.yazi = {
    enable = true;

    # yazi configuration
    settings = {
      manager = {
        sort_by = "natural";
        show_hidden = true;
      };

      opener = {
        edit = [
          {
            run = ''hx "$@"'';
            block = true;
            for = "unix";
          }
        ];
      };
    };
  };
}
