{ inputs, userConfig, ... }:

{
  imports = [
    "${inputs.nix-secrets}/syncthing.nix"
  ];

  # P2P file synchronization
  services.syncthing = {
    enable = true;

    user = "${userConfig.username}";
    group = "users";
    dataDir = "/home/${userConfig.username}/Sync";

    overrideDevices = true;
    overrideFolders = true;
  };
}

