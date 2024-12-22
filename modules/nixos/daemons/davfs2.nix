{
  # Mount WebDAV resources as a file system
  services.davfs2 = {
    enable = true;

    settings = {
      globalSection = {
        ask_auth = false;
      };
    };
  };
}
