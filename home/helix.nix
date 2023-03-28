{
  config,
  pkgs,
  helix,
  ...
}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "adwaita-dark";
      editor.line-number = "relative";
    };
    languages = [
      {
        name = "nix";
        formatter.command = "${pkgs.alejandra}/bin/alejandra";
      }
    ];
    package = helix.packages.${pkgs.system}.helix;
  };
}
