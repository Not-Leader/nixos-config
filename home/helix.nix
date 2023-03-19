{config, pkgs, helix, ...}:
{
  programs.helix = {
    enable = true;
    settings.theme = "adwaita-dark";
    package = helix.packages.${pkgs.system}.helix;
  };
}
