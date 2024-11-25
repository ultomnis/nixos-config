{
  # WireGuard networks
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
}
