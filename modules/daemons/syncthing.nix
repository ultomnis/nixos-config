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
        "desktop" = { id = "KBRRA7H-TF7G5MC-P2PRUJP-2WA62NK-RLYBD6M-BQ4JDZA-XB5PKUC-4VPQTQE"; };
        "laptop" = { id = "AYANVLS-SUFWCB2-SHDO2EQ-GUCEMZW-44SBOAA-NMF6E4X-BHW7OFS-IVDZCAK"; };
        "phone" = { id = "JRI2PJF-O3ZQQ24-63O6PP4-TJQNH5O-NQGBGTA-NXVT2BY-HUYT3CR-4YVUWQU"; };
      };

      folders = {
        "KeePass" = {
          path = "/home/${userConfig.username}/Sync/KeePass";
          devices = [ "desktop" "laptop" "phone" ];
        };
      };
    };
  };
}
