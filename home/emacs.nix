{
  config,
  pkgs,
  emacs-overlay,
  ...
}: {
  programs.emacs = {
    enable = true;
    package = emacs-overlay.packages.${pkgs.system}.emacsPgtk;
  };
}
