{
  lib,
  options,
  vars,
  ...
}:

{
  # Mesh VPN service
  services.tailscale =
    {
      enable = true;
    }
    // lib.optionalAttrs (builtins.hasAttr "useRoutingFeatures" options.services.tailscale) {
      useRoutingFeatures = "${vars.tailscaleRouting}";
    };
}
