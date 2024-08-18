{
  environment.variables = {
    HOMEBREW_NO_ANALYTICS = "1";
  };

  # sudo authentication with Touch ID
  security.pam.enableSudoTouchIdAuth = true;

  # macOS settings
  system.defaults = {
    dock = {
      autohide = true;
      mru-spaces = false;
      show-recents = false;
      static-only = true;
    };

    finder = {
      AppleShowAllExtensions = true; # show file extensions
      AppleShowAllFiles = true; # show hidden files
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
