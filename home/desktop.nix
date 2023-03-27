{config, lib, pkgs, ... }:
{
  xdg.desktopEntries = {
    webcord = {
      categories = [ "Network" "InstantMessaging" ];
      comment = "A Discord and Fosscord electron-based client implemented without Discord API";
      exec = "webcord";
      icon = "webcord";
      name = "WebCord";
      type = "Application";
    };
    freeTube = {
      name = "FreeTube";
      exec = "freetube --no-sandbox %U";
      terminal = "false";
      type = "Application";
      icon = "freetube";
      startupWMClass = "FreeTube";
      comment = "A private YouTube client";
      mimeType = "x-scheme-handler/freetube";
      categories = [ "Network" ];
    };
  };
}
