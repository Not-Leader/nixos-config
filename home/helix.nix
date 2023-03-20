{config, pkgs, helix, ...}:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "adwaita-dark";
      editor.line-number = "relative";
    };
    package = helix.packages.${pkgs.system}.helix;
  };
}
