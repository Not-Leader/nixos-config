{helix, ... }:
{config, pkgs, ...}:
{
  programs.helix = {
    enable = true;
    settings.theme = "base16_default_dark";
    package = helix.packages.{$pkgs.system}.helix;
  };
}
