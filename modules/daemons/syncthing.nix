{ nix-secrets, ... }:

let 
  username = "user";

in {
  imports = [
    "${nix-secrets}/syncthing.nix"
  ];

  # P2P file synchronization
  services.syncthing = {
    enable = true;

    user = "${username}";
    group = "users";
    dataDir = "/home/${username}/Sync";

    overrideDevices = true;
    overrideFolders = true;
  };
}

