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
        "laptop" = { id = "N7B4DR4-VBH545L-CZCZXGP-YX7ULCR-KANRSDY-5YDF2ZK-TSVU322-PFVGZQJ"; };
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
