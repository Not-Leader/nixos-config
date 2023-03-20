{config, pkgs, helix, ...}:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "adwaita-dark";
      line-number = "relative";
    };
    package = helix.packages.${pkgs.system}.helix;
  };
}
