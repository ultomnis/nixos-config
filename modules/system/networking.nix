{ lib, userConfig, ... }:

{
  # iNet wireless daemon
  networking.wireless.iwd = {
    enable = true;
    settings = {
      General = {
        EnableNetworkConfiguration = true;
      };
    };
  };
}
