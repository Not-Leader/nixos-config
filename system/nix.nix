{
  config,
  lib,
  pkgs,
  ...
}: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = [
      "root"
      "not-leader"
    ];
    substituters = [
      "https://cache.nixos.org"
      "https://helix.cachix.org"
      "https://nix-community.cachix.org"
      "https://nixpkgs.wayland.cachix.org"
    ];
    trusted-public-keys = [
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
    ];
  };
}
