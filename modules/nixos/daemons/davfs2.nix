{
  # Mount WebDAV resources
  services.davfs2 = {
    enable = true;
    settings = {
      globalSection = {
        ask_auth = false;
      };
    };
  };
}
