{ pkgs, ... }:

{
  # Login manager daemon
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        # tuigreet command to run Hyprland
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };
}
