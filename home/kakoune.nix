{config, lib, pkgs, ... }:

{
  progams.kakoune = {
    enable = true;
    plugins = with pkgs.kakounePlugins; [
      kak-lsp
    ];
  };
}
