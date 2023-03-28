{
  config,
  lib,
  pkgs,
  ...
}: {
  nix.settings = {
    substituters = [
      "https://cache.nixos.org"
      "https://helix.cachix.org"
    ];
    trusted-public-keys = [
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
    ];
  };
}
