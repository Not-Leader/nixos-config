{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  imports = [ 
    ./theme.nix 
    ./i3status-rs.nix 
  ];
  
  home.username = "not-leader";
  home.homeDirectory = "/home/not-leader";

  programs.bash = {
    enable = true;
    profileExtra = ''
      export GTK_IM_MODULE=fcitx
      export QT_IM_MODULE=fcitx
      export XMODIFIERS=@im=fcitx
      export INPUT_METHOD=fcitx
      export GLFW_IM_MODULE=ibus
      export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
    '';
    bashrcExtra = "export EDITOR=hx";
  };

  programs.helix.enable = true;
  programs.helix.settings.theme = "base16_default_dark";

  xdg.configFile."wezterm/wezterm.lua".source = ./wezterm.lua;

  xdg.configFile."Vieb/viebrc".source = ./vieb;
  xdg.configFile."Discord/viebrc".source = ./vieb;
  xdg.configFile."Cinny/viebrc".source = ./vieb;

  xdg.configFile."sway/config".source = ./sway;

  services.gammastep = { 
    enable = true;
    provider = "geoclue2";
  };

  home.packages = with pkgs; [
    zathura
    sway-contrib.grimshot
    neofetch
    vieb
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
  ];

  programs.git = {
    enable = true;
    userName = "not-leader";
    userEmail = "not-leader1@outlook.com";
  };

  services.gnome-keyring = {
    enable = true;
    components = [ "ssh" ];
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

