{ pkgs, ... }:

{
  # Login manager daemon
  services.greetd = {
    enable = true;
    vt = 2;

    settings = {
      default_session = {
        # Graphical console greeter
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd ${pkgs.sway}/bin/sway";
      };
    };
  };
}
