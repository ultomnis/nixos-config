{
  # RSS feed reader
  programs.newsboat = {
    enable = true;
    autoReload = true;

    urls = [
      {
        tags = [ "linux" ];
        url = "https://nixos.org/blog/announcements-rss.xml";
      }
      {
        tags = [ "linux" ];
        url = "https://www.phoronix.com/rss.php";
      }
    ];
  };
}
