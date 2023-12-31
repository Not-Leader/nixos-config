{
  config,
  lib,
  pkgs,
  ...
}: {
  xdg.desktopEntries = {
    webcord = {
      categories = ["Network" "InstantMessaging"];
      comment = "A Discord and Fosscord electron-based client implemented without Discord API";
      exec = "webcord --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "webcord";
      name = "WebCord Wayland";
      type = "Application";
    };
    freetube = {
      name = "FreeTube Wayland";
      exec = "freetube --enable-features=UseOzonePlatform --ozone-platform=wayland --no-sandbox %U";
      terminal = false;
      type = "Application";
      icon = "freetube";
      comment = "A private YouTube client";
      categories = ["Network"];
    };
    quake = {
      categories = ["Game" "Shooter"];
      comment = "a very old shooter";
      exec = "sh -c \"ezquake -basedir ~/nquake\"";
      name = "Quake";
      type = "Application";
    };
    sameboy = {
      categories = ["Game" "Music"];
      comment = "music but also gameboy";
      exec = "sameboy";
      name = "Sameboy";
      type = "Application";
    };
  };
}
