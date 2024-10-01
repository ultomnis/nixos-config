{ userConfig, ... }:

{
  # P2P file synchronization
  services.syncthing = {
    enable = true;

    user = "${userConfig.username}";
    group = "users";
    dataDir = "/home/${userConfig.username}/Sync";

    overrideDevices = true;
    overrideFolders = true;
    
    settings = {
      devices = {
        "desktop" = { id = "SOYT7RW-KCZK6LA-TMADIQX-C3NDTWW-LO5ABQC-K5QRWCG-34HH7V5-W7NXUAK"; };
        "phone" = { id = "Y7X4JVO-CBFLCEV-DI6RXIL-Z3H7H5U-D5EPPZR-NO2JITE-WE4KYLJ-BZHCIQQ"; };
      };

      folders = {
        "KeePass" = {
          path = "/home/${userConfig.username}/Sync/KeePass";
          devices = [ "desktop" "phone" ];
        };
      };
    };
  };
}