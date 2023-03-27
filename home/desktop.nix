{config, lib, pkgs, ... }:
{
  xdg.desktopEntries = {
    webcord = {
      categories = [ "Network" "InstantMessaging" ];
      comment = "A Discord and Fosscord electron-based client implemented without Discord API";
      exec = "webcord --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "webcord";
      name = "WebCord";
      type = "Application";
    };
    freeTube = {
      name = "FreeTube";
      exec = "freetube --enable-features=UseOzonePlatform --ozone-platform=wayland --no-sandbox %U";
      terminal = false;
      type = "Application";
      icon = "freetube";
      comment = "A private YouTube client";
      categories = [ "Network" ];
    };
  };
}
