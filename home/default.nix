{
  config,
  pkgs,
  ...
}: let
  my-python-packages = p:
    with p; [
      python-lsp-server
    ];
in {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  imports = [
    ./theme.nix
    ./i3status-rs.nix
    ./helix.nix
    ./desktop.nix
  ];

  home.username = "not-leader";
  home.homeDirectory = "/home/not-leader";

  programs.bash = {
    enable = true;
    bashrcExtra = "${pkgs.pfetch}/bin/pfetch";
  };

  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
    GLFW_IM_MODULE = "ibus";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    EDITOR = "hx";
  };

  xdg.configFile = {
    "wezterm/wezterm.lua".source = ./wezterm.lua;

    "sway/config".source = ./sway;
    "sway/grim-menu.sh" = {
      source = ./grim-menu.sh;
      executable = true;
    };

    "fuzzel/fuzzel.ini".source = ./fuzzel.ini;
  };

  services.gammastep = {
    enable = true;
    provider = "geoclue2";
    temperature.day = 6500;
  };

  home.packages = with pkgs; [
    zathura
    sway-contrib.grimshot
    pfetch
    librewolf
    webcord
    freetube
    ranger
    wezterm
    fuzzel
    nil
    virt-manager
    axel
    keepassxc
    pulseaudio
    wl-clipboard
    qalculate-gtk
    (pkgs.python3.withPackages my-python-packages)
  ];

  programs.mpv.enable = true;
  
  programs.git = {
    enable = true;
    userName = "not-leader";
    userEmail = "not-leader1@outlook.com";
  };

  services.gnome-keyring = {
    enable = true;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
