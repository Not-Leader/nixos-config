{config, lib, pkgs, ... }:

{
  programs.kakoune = {
    enable = true;
    plugins = with pkgs.kakounePlugins; [
      kak-lsp
    ];
  };
}
