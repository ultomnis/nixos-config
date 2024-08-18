{
  # Daemon to update device firmware
  services.fwupd = {
    enable = true;

    daemonSettings = {
      ShowDevicePrivate = false;
    };
  };
}
