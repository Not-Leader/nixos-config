{ config, pkgs, ...}:

{
  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
  };

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;

    font = {
      name = "Noto Sans";
      size = 9;
    };

    theme = {
      name = "Lounge-night";
      package = pkgs.lounge-gtk-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme= {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 16;
    };

  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = { 
      name = "Adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}