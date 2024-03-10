{
  # Notification daemon
  services.dunst = {
    enable = true;

    settings = {
      global = {
        follow = "mouse";
        offset = "10x10";
      };
    };
  };
}
