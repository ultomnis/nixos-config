{
  # macOS settings
  system.defaults = {
    dock = {
      autohide = true;
      mru-spaces = false;
      show-recents = false;
      static-only = true;
      wvous-bl-corner = 11; # Launchpad
      wvous-br-corner = 2; # Mission Control
    };

    finder = {
      AppleShowAllExtensions = true; # show file extensions
      AppleShowAllFiles = true; # show hidden files
    };

    NSGlobalDomain = {
      NSWindowShouldDragOnGesture = true;
    };

    spaces = {
      spans-displays = true; # disable displays have separate spaces
    };

    trackpad = {
      Clicking = true;
      Dragging = true;
    };

    WindowManager = {
      GloballyEnabled = false; # stage manager
    };
  };
}
