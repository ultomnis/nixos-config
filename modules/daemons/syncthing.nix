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
        "desktop" = { id = "WX32F3E-36RYTBT-HBIGMGT-H3CN7E3-2LDIMUR-QTXWHS6-7KJK6F4-Z4V5PQH"; };
        "laptop" = { id = "AYANVLS-SUFWCB2-SHDO2EQ-GUCEMZW-44SBOAA-NMF6E4X-BHW7OFS-IVDZCAK"; };
        "phone" = { id = "L3MS7JN-KWLOXIK-A5BYHSZ-TAJ43YK-BA2FGPL-CX7ZKST-3XGGYBF-KKLFKQI"; };
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
