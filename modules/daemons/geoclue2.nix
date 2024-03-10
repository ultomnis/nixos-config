{
  # Provide location information
  services.geoclue2 = {
    enable = true;

    # Set color temperature using location
    appConfig.gammastep = {
      isAllowed = true;
      isSystem = false;
    };
  };
}
