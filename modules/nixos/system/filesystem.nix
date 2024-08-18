{
  # Compression
  fileSystems."/".options = [ "compress=zstd" ];

  # Btrfs automatic scrubbing
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };

  # zram swap space
  zramSwap.enable = true;
}
