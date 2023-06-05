# A Greetd thing because it's too big
{
  config,
  lib,
  pkgs,
  ...
}: let
  swayConfig = pkgs.writeText "greetd-sway-config" ''
    # `-l` activates layer-shell mode. Notice that `swaymsg exit` will run after gtkgreet.
    exec "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l -c sway; swaymsg exit"
    bindsym Mod4+shift+f exec swaynag \
      -t warning \
      -m 'What do you want to do?' \
      -b 'Poweroff' 'systemctl poweroff' \
      -b 'Reboot' 'systemctl reboot'
    input * {
      xkb_layout us
      xkb_variant colemak_dh
    }
  '';
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "/usr/bin/env GTK_THEME=Adwaita-dark ${pkgs.sway}/bin/sway --config ${swayConfig}";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    sway
    bash
  '';
}
