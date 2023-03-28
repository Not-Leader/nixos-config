{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.i3status-rust = {
    enable = true;
    bars.status = {
      blocks = [
        {
          block = "disk_space";
          path = "/";
          info_type = "free";
          interval = 60;
          warning = 20.0;
          alert = 10.0;
        }
        {
          block = "memory";
          format = " $icon $mem_used_percents ";
        }
        {
          block = "cpu";
          interval = 1;
        }
        {
          block = "net";
          device = "wlp0s20f3";
          format = " $icon $ssid ($signal_strength) ";
        }
        {block = "sound";}
        {
          block = "battery";
          format = " $icon $percentage $time ";
        }
        {
          block = "time";
          interval = 1;
          format = " $timestamp.datetime(f:'%F %T') ";
        }
      ];
      icons = "awesome4";
      theme = "native";
    };
  };
}
